import React, { useState } from 'react';

import './Search.css';
import searchIcon from '../assets/search.svg';

const Search = ({ search }) => {
  const [searchValue, setSearchValue] = useState('');

  const handleSearchInputChanges = e => {
    setSearchValue(e.target.value);
  };

  const resetInputField = () => {
    setSearchValue('');
  };

  const callSearchFunction = e => {
    e.preventDefault();
    search(searchValue);
    resetInputField();
  };

  return (
    <div className="search">
      <form className="search-box">
        <input
          value={searchValue}
          onChange={handleSearchInputChanges}
          type="text"
          placeholder="Search stories"
          className="search-text"
        />

        <button
          onClick={callSearchFunction}
          type="submit"
          className="search-button"
        >
          <img src={searchIcon} alt="Search" />
        </button>
      </form>
    </div>
  );
};

export default Search;
