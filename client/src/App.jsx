import React, { Component } from 'react';
import './App.css';
import Stories from './Stories';

class App extends Component {
  render() {
    return (
      <div className="hacker-news">
        <header>
          <h1>Hacker News</h1>
        </header>
        <Stories />
      </div>
    );
  }
}

export default App;
