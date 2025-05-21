import React from 'react'
import './footer.css'
import footerImg from '../assets/footerimg.svg'
const Footer = () => {
  return (
    <div className='footer_main_div'>
      <div className="footer_inner_first_div">
        <div className="footer_first_child_div">
          <img src={footerImg} alt="" />
          <h2>Medingen</h2>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique deleniti est ipsam suscipit porro nonc.Similique deleniti est ipsam suscipit porro non</p>
        </div>
        <div className="footer_second_child_div">
          <div className="lower_div first_lower_div">
            <label htmlFor="">website</label>
            <ul>
              <li>Home</li>
              <li>Features</li>
              <li>How it works</li>
              <li>what our customer say?</li>
            </ul>
          </div>
          <div className="lower_div second_lower_div">
          <label htmlFor="">Follow Us</label>
            <ul>
              <li>Instagram</li>
              <li>Facebook</li>
              <li>Twitter</li>
              <li>Youtube</li>
            </ul>
          </div>
          <div className="lower_div third_lower_div">
          <label htmlFor="">More</label>
            <ul>
              <li>Help Center</li>
              <li>Become Member</li>
              <li>Events</li>
              <li>Terms & Conditions</li>
            </ul>
          </div>
        </div>
      </div>
      <div className="footer_inner_second_div">
        <p>
          @2024 Medingen. All Rights Reserved
        </p>
        </div>
    </div>
  )
}

export default Footer