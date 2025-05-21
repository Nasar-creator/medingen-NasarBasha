import React, { useEffect, useState } from "react";
import axios from "axios";

const FOQ = () => {
  const [faqs, setFaqs] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:5000/api/faqs/1")
      .then((res) => {
        console.log(res.data);

        setFaqs(res.data);
      })
      .catch((err) => {
        console.error("Error fetching FAQs:", err);
      });
  }, []);

  return (
    <div className="faq_main_div">
      <div className="faq_head_div">
        <h2 className="faq_head">Frequently Asked Questions</h2>
      </div>
      <div className="faq_inner_div">
        {faqs.length === 0 ? (
          <p>No FAQs available.</p>
        ) : (
          faqs.map((faq) => (
            <div key={faq.id} className="faq_item">
              <h4 className="faq_question">{faq.question}</h4>
              <p className="faq_answer">{faq.answer}</p>
            </div>
          ))
        )}
      </div>
    </div>
  );
};

export default FOQ;
