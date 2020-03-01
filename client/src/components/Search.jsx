import React, { useState } from 'react';

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
      <form>
        <input
          value={searchValue}
          onChange={handleSearchInputChanges}
          type="text"
          placeholder="Search stories"
        />
        <input onClick={callSearchFunction} type="submit" value="Search" />
      </form>
    </div>
  );
};

export default Search;
