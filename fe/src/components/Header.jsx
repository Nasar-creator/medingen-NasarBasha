import React from 'react'
import home from '../assets/icon/homeicon.svg'
import offer from '../assets/icon/offer.svg'
import notification from '../assets/icon/notification.svg'
import person from '../assets/icon/profile.svg'
import cart from '../assets/icon/cart.svg'
import logo from '../assets/migfulllogo.png'
import './header.css'
const Header = () => {
  return (
    <div className="header_main_div">
        {/* <div className="header_inner_div"> */}
        <div className="header_inner_first_div">
          <img src={logo} alt="logo" className='logo'/>
          <p>

            Medingen
          </p>
        </div>
        <div className="header_inner_second_div">
            <div className='header_inner_middle_section home_img'>

            <img src={home} alt="image" />
            <p>Home</p>
            </div>
            <div className='header_inner_middle_section'>

            <img src={offer} alt="image" />
            <p>Offer</p>
            </div>
            <div className='header_inner_middle_section'>

            <img src={notification} alt="image" />
            <p>Notification</p>
            </div>
            <div className='header_inner_middle_section'>

            <img src={person} alt="image" />
            <p>Profile</p>
            </div>
        </div>
        <div className="header_inner_third_div">
            <div className="third_img_div">

            <img src={cart} alt="image" />
            </div>

        </div>
        {/* </div> */}
    </div>
  )
}

export default Header