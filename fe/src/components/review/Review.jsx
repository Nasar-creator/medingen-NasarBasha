import axios from "axios";
import React, { useEffect, useState } from "react";

const Review = () => {
  const [reviews, setReviews] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const token = localStorage.getItem("token");
  console.log({ token }, "tokentokentoken");

  useEffect(() => {
    axios
      .get("http://localhost:5000/api/reviews/1", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((response) => {
        setReviews(response.data);
        setLoading(false);
      })
      .catch((err) => {
        setError("Failed to fetch reviews");
        setLoading(false);
      });
  }, []);

  if (loading) return <p>Loading reviews...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div className="review_main_div">
      <div className="review_inner_div">
        <h3>Ratings & Reviews</h3>
        {reviews && reviews.length > 0 ? (
          reviews.map((review) => (
            <div key={review.id || review.comment}>
              <p>Rating: {review.rating} ⭐</p>
              <p>"{review.comment}"</p>
            </div>
          ))
        ) : (
          <p>No reviews found.</p>
        )}
      </div>
    </div>
  );
};

export default Review;
