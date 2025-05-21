import React from "react";
import image1 from "../../assets/injection.png";
import image2 from "../../assets/syrup.png";
import image3 from "../../assets/tablet.png";
export const Bottom = () => {
  return (
    <div className="bottom_outer_div">
      <div className="bottom_inner_div">
        <div className="bottom_inner_section">
          <img src={image3} alt="" />
          <p>tablet are good</p>
        </div>
        <div className="bottom_inner_section">
          <img src={image2} alt="" />
          <p>Syrup are good</p>
        </div>
        <div className="bottom_inner_section">
          <img src={image1} alt="" />
          <p>Injection are good</p>
        </div>
      </div>
    </div>
  );
};
