import React from 'react';
import axios from 'axios';

class Stories extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isLoaded: false,
      stories: []
    };
  }

  fetchData() {
    axios.get('/api/stories').then(
      result => {
        this.setState({
          stories: result.data,
          isLoaded: true
        });
      }
    );
  }

  componentDidMount() {
    this.fetchData();
  }

  renderList() {
    const { isLoaded, stories } = this.state;

    if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (
        <ol>
          {stories.map(story => (
            <li key={story.id}>{story.title}</li>
          ))}
        </ol>
      );
    }
  }

  render() {
    return (
      <div className="stories">
        <h2>Top 15 Hacker News</h2>
        {this.renderList()}
      </div>
    );
  }
}

export default Stories;
