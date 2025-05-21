import React, { useEffect, useState } from "react";
import MedicineDetails from "../components/MedicineDetails";
// import SaltContenfrom './components/SaltContent';
// import Reviews from './components/Reviews';
import Alternatives from "../components/Alternatives";
import "./main.css";
import axios from "axios";
import Compare from "./Compare";
import Review from "./review/Review";
import Disclaimer from "./disclaimer/Disclaimer";
import { Bottom } from "./disclaimer/Bottom";
import FOQ from "./FOQ";

function Main() {
  const [medicine, setMedicine] = useState(null);
  const token = localStorage.getItem("token");
  useEffect(() => {
    axios
      .get("http://localhost:5000/api/medicine/1", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((data) => setMedicine(data));
  }, []);

  if (!medicine) return <p>Loading...</p>;

  return (
    <div className="app-container">
      <MedicineDetails data={medicine} />
      <Compare />
      <FOQ />
      <Review />
      <Disclaimer />
      <Bottom />
    </div>
  );
}
export default Main;
