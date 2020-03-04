import React from 'react';

import './Header.css';
import logo from '../assets/logo.png';

const Header = () => {
  return (
    <header className="header">
      <div className="header-logo">
        <img src={logo} alt="Hacker News logo" />
      </div>

      <h1>Hacker News</h1>
    </header>
  );
};

export default Header;
