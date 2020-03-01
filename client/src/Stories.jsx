import React from 'react';
import axios from 'axios';
import Story from './Story'

class Stories extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      errorMessage: null,
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
      },
      error => {
        this.setState({
          errorMessage: error.message
        });
      }
    );
  }

  componentDidMount() {
    this.fetchData();
  }

  renderList() {
    const { errorMessage, isLoaded, stories } = this.state;

    if (errorMessage) {
      return <div>The stories could not be loaded because of:<br />{errorMessage}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (
        <ol>
          {stories.map(story => (
            <li key={story.id}>
              <Story {...story} />
            </li>
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
