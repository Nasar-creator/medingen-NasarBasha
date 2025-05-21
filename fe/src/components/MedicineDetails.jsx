import React from "react";
import arrowback from "../assets/icon/arrow_back.png";
import Alternatives from "./Alternatives";
const MedicineDetails = (medicine) => {
  console.log({ medicine }, "innnnnnnnnnnnnnnnnn");

  return (
    <div className="medicinedetails_main_div">
      <div className="top_para">
        <img src={arrowback} alt="back arrow" />
        <p>Paracetamol/acetaminophen</p>
      </div>
      <div className="medicinedetails_dialogbox">
        <div className="medicinedetails_left_dialogbox">
          <h2 className="medicinedetails_left_dialogbox_top_head">
            Medicine Details
          </h2>
          <div className="left_dialogbox_inner_top_div">
            <div className="left_dialogbox_inner_div">
              <h2>About {medicine.data.data.name}</h2>
              <p>
                UDILIV 300MG TABLET 15'S (UDCA) is a naturally occurring bile
                acid derived from the bear bile, and it is abo produced
                synthetically, it has been used for several decades as a
                therapeutic agent to manage various liver disorders. UDCA is
                primarily known for its hepatoprotective properties and is used
                in the treatment of gallstones, primary biliary cholangitis
                (PBC), and other cholestatic liver conditions. This bile acid
                works by reducing cholesterol absorption, improving bile flow,
                and exerting anti-inflammatory effects, thereby promoting liver
                health.
              </p>
            </div>
            <div className="left_dialogbox_inner_div">
              <h2>Uses {medicine.data.data.name}</h2>
              <ul>
                <li>Helps in dissolving gallstones.</li>
                <li>
                  is used in the treatment of primary biliary cholangitis (PBC)
                </li>
                <li>Aide in managing other cholestatic liver disorders.</li>
                <li>Can be used to prevent gallstone formation.</li>
                <li>Assists in improving liver function.</li>
              </ul>
            </div>
            <div className="left_dialogbox_inner_div">
              <h2>How {medicine.data.data.name} Works</h2>
              <ul>
                <li>
                  Dosage for children: The dosage of UDILIV 500MG TABLET 15'S
                  for children depends on their body weight and the specific
                  liver disorder being treated. It is typically prescribed by a
                  pediatrician or gastroenterologist who will determine the
                  appropriate dosage.
                </li>
                <li>
                  Dosage for Adults: The recommended dosage of LUDILIV 300MG
                  TABLET 15'5 for adults varies depending on the indication. For
                  gallstone dissolution, the usual dose is -10 mg/kg body weight
                  per day, divided into two to three doses, in the treatment of
                  primary biliary cholangitis (PBC), the typical dose ranges
                  from 13-15 mg/kg body weight per day, also divided into
                  multiple doses. However, dosages may differ based on
                  individual patient factors, and it is essential to follow the
                  specific instructions provided by a healthcare professional
                </li>
              </ul>
            </div>
            <div className="left_dialogbox_inner_div">
              <h2>Side Effects Of {medicine.data.data.name}</h2>
              <h3>Common Side Effects of {medicine.data.data.name}</h3>
              <ul>
                <li>Diarrhea</li>
                <li>Abdominal disconfort</li>
                <li>Nousea</li>
                <li>Vomiting</li>
                <li>Hair loss (rare)</li>
              </ul>
            </div>
          </div>
        </div>
        <div className="medicinedetails_right_dialogbox">
          <Alternatives />
        </div>
      </div>
    </div>
  );
};

export default MedicineDetails;
