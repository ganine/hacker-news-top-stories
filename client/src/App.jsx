import React, { Component } from "react";
import "./App.css";

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="App">
        <header>
          <h1>Hacker News</h1>
        </header>
        <h2>Top 15 Hacker News</h2>
      </div>
    );
  }
}

export default App;
