import React, { useEffect, useState } from "react";
import axios from "axios";

const Alternatives = () => {
  const [genericalternative, setSenericalternative] = useState("");
  const token = localStorage.getItem("token");
  useEffect(() => {
    axios
      .get("http://localhost:5000/api/generic-alternatives", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((data) => {
        setSenericalternative(data);
      })
      .catch((err) => {
        console.log("errr in alter", err);
      });
  }, []);

  if (!genericalternative) return <p>Loading...</p>;

  return (
    <div className="alter_most_outer_div">
      <h1>Generic Medicine Alternative</h1>
      <div className="alter_outer_div">
        {genericalternative.data.map((item, index) => {
          return (
            <div key={index} className="alter_inner_div">
              <div className="alter_inner_first_div">
                <img
                  src={item.image_url}
                  alt=""
                  className="alter_inner_image"
                />
              </div>
              <div className="alter_inner_second_div">
                <h2>{item.title}</h2>
                <h3>{item.brand}</h3>
                <h4>{item.composition}</h4>
                <div className="price_div">
                  <p className="original_price">Rs.{item.price}</p>
                  <p className="discounted_price">
                    Rs.{item.price - (item.price * item.discount) / 100}
                  </p>
                  <p className="discounted_para">
                    {item.discount}% less price{" "}
                  </p>
                </div>
              </div>
              <div className="alter_inner_third_div">
                <button className="alter_btn"> + Add</button>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default Alternatives;
