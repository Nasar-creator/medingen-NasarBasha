from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_jwt_extended import JWTManager, create_access_token, jwt_required
import mysql.connector

# ---------------------- App Configuration ---------------------- #
app = Flask(__name__)


CORS(app, resources={r"/*": {"origins": "*"}})


app.config['JWT_SECRET_KEY'] = 'secret'

jwt = JWTManager(app)

# ---------------------- Database Connection ---------------------- #
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Nasar@2003",
    database="medingen"
)
cursor = conn.cursor(dictionary=True)

# ---------------------- Demo Route ---------------------- #
@app.route('/api/demo', methods=['GET'])
def demo():
    return jsonify({"msg": "API is working!"})

@app.route('/api/signup', methods=['POST'])
def signup():
    data = request.json
    cursor.execute(
        "INSERT INTO users (email, password) VALUES (%s, %s)",
        (data['email'], data['password'])
    )
    conn.commit()
    return jsonify({"msg": "Signup successful"})

@app.route('/api/login', methods=['POST'])
def login():
    data = request.json
    cursor.execute(
        "SELECT * FROM users WHERE email=%s AND password=%s",
        (data['email'], data['password'])
    )
    user = cursor.fetchone()

    if user:
        token = create_access_token(identity=user['email'])
        return jsonify({"token": token})
    return jsonify({"msg": "Invalid credentials"}), 401

@app.route('/api/product-details', methods=['GET'])
@jwt_required()
def get_product_details():
    cursor.execute("SELECT * FROM products")
    return jsonify(cursor.fetchall())

@app.route('/api/medicine/<int:product_id>', methods=['GET'])
def get_medicine(product_id):
    cursor.execute('SELECT * FROM products WHERE id = %s', (product_id,))
    medicine = cursor.fetchone()
    return jsonify(medicine)

@app.route('/api/generic-alternatives', methods=['GET'])
@jwt_required()
def get_alternatives():
    cursor.execute("SELECT * FROM alternatives")
    return jsonify(cursor.fetchall())


@app.route("/api/compare-by-salt/<int:product_id>", methods=["GET"])
# #@jwt_required()
def compare_by_salt(product_id):
    try:
        cursor = conn.cursor(dictionary=True)

        cursor.execute("SELECT salt_id FROM productsalts WHERE product_id = %s", (product_id,))
        salt_rows = cursor.fetchall()
        salt_ids = [row["salt_id"] for row in salt_rows]

        if not salt_ids:
            return jsonify([]), 200

        format_strings = ','.join(['%s'] * len(salt_ids))
        query = f"""
            SELECT DISTINCT p.id, p.name, p.price, p.image_url, p.manufacturer,
                            p.composition, p.brand, p.discount
            FROM products p
            JOIN productsalts ps ON p.id = ps.product_id
            WHERE ps.salt_id IN ({format_strings})
              AND p.id != %s
        """
        cursor.execute(query, (*salt_ids, product_id))
        products = cursor.fetchall()

        for product in products:
            cursor.execute("""
                SELECT rating, comment
                FROM reviews
                WHERE product_id = %s
                LIMIT 1
            """, (product['id'],))
            reviews = cursor.fetchall()
            product['reviews'] = reviews

        return jsonify(products), 200

    except Exception as e:
        print("Error in compare_by_salt:", e)
        return jsonify({"error": "Server error"}), 500


@app.route('/api/reviews/<int:product_id>', methods=['GET'])
def get_reviews(product_id):
    cursor.execute("SELECT * FROM reviews WHERE product_id = %s", (product_id,))
    return jsonify(cursor.fetchall())

@app.route("/api/faqs/<int:product_id>", methods=["GET"])
def get_faqs(product_id):
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT id, question, answer FROM faq WHERE product_id = %s",
            (product_id,)
        )
        faqs = cursor.fetchall()
        return jsonify(faqs), 200
    except Exception as e:
        print("Error fetching FAQs:", e)
        return jsonify({"error": "Server error"}), 500

if __name__ == '__main__':
    app.run(debug=True)
