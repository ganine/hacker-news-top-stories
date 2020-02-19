import React, { Component } from "react";
import "./App.css";

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      health: "Checking"
    };
  }

  componentDidMount() {
    fetch("/health")
      .then(response => response.json())
      .then(json => this.setState({ health: json }))
      .catch(error => console.log(error));
  }

  render() {
    const { health } = this.state;

    return (
      <div className="App">
        <h1>Hacker News Top Stories</h1>
        <h2>API Health Status</h2>
        {JSON.stringify(health)}
      </div>
    );
  }
}

export default App;
