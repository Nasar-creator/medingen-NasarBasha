// import axios from "axios";
// import React, { useEffect, useState } from "react";

// const Compare = () => {
//   const token = localStorage.getItem("token");
//   console.log({ token });
//   const [comparedata, setComparedata] = useState("");
//   useEffect(() => {
//     axios
//       .get("http://localhost:5000/api/compare-medicines", {
//         headers: {
//           Authorization: `Bearer ${token}`,
//         },
//       })
//       .then((data) => {
//         setComparedata(data);
//       })
//       .catch((err) => {
//         console.log({ err }, "-------line 19");
//       });
//   }, []);

//   return (
//     <div className="compare_outer_div">
//       <div className="compare_inner_top_div">
//         <h2>Compare medicine</h2>
//         <p>Compare medicine price composition to make your decision</p>
//       </div>
//     </div>
//   );
// };

// export default Compare;

import React, { useEffect, useState } from "react";
import axios from "axios";

const Compare = ({ productId, token }) => {
  const [alternatives, setAlternatives] = useState([]);

  useEffect(() => {
    axios
      .get(`http://localhost:5000/api/compare-by-salt/1`, {
        headers: { Authorization: `Bearer ${token}` },
      })
      .then((res) => setAlternatives(res.data))
      .catch((err) => console.log(err));
  }, [productId]);

  return (
    <div className="alt-container">
      <h2>Comparison medicine</h2>
      <p className="comparison_para">
        Compare medicine price composition to make your desicion
      </p>
      <div className="alt-grid">
        {console.log(alternatives)}
        {alternatives.map((med) => (
          <div className="alt-card" key={med.id}>
            <div className="alt_image_div">
              <img
                src={med.image_url}
                alt={med.name}
                className="comparison_image"
              />
            </div>
            <div className="table_inner_content">
              <h4>{med.name}</h4>
              <p className="brand_para">By {med.brand}</p>
              <p className="generic_label">Generic Name: </p>
              <p className="generic_Name">{med.composition}</p>
              <p className="actual_price_label">Actual Price: </p>
              <p className="actual_price">Rs {med.price}</p>
              <div className="discount_div">
                <p>{med.discount}% Off </p>
                <p className="price_para">
                  Rs {Math.floor(med.price - (med.price * med.discount) / 100)}
                </p>
              </div>
              <div className="rating_div">
                {med?.reviews?.length > 0 ? (
                  med.reviews.map((item, index) => (
                    <div key={index}>
                      <p>⭐ {item.rating}</p>
                      <p className="review_comment">{item.comment}</p>
                    </div>
                  ))
                ) : (
                  <p>No reviews yet</p>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Compare;
