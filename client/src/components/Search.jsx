import React, { useState } from 'react';

import './Search.css';

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
      <div className="search-box">
        <form>
          <input
            value={searchValue}
            onChange={handleSearchInputChanges}
            type="text"
            placeholder="Search stories"
            className="search-text"
          />
          <input
            onClick={callSearchFunction}
            type="submit"
            value="Search"
            className="search-button"
          />
        </form>
      </div>
    </div>
  );
};

export default Search;
