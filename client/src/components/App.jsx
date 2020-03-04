import React, { useEffect, useReducer } from 'react';
import { initialState, reducer} from '../store/reducers/storiesReducer';
import axios from 'axios';
import './App.css';
import Header from './Header';
import Search from './Search';
import Story from './Story';

const App = () => {

  const [state, dispatch] = useReducer(reducer, initialState);

  useEffect(() => {
    axios.get('/api/stories').then(
      result => {
        dispatch({
          type: 'FETCH_STORIES_SUCCESS',
          payload: result.data
        });
      },
      error => {
        dispatch({
          type: 'FETCH_STORIES_FAILURE',
          error: error.message
        });
      }
    );
  }, []);

  const search = term => {
    dispatch({
      type: 'FETCH_STORIES_REQUEST'
    });

    axios.get(`/api/stories/search?term=${term}`).then(
      result => {
        dispatch({
          type: 'FETCH_STORIES_SUCCESS',
          payload: result.data
        });
      },
      error => {
        dispatch({
          type: 'FETCH_STORIES_FAILURE',
          error: error.message
        });
      }
    );
  };

  const { stories, errorMessage, isLoading } = state;

  const storyList = (
    <ol>
      {stories.map(story => (
        <li key={story.id}>
          <Story {...story} />
        </li>
      ))}
    </ol>
  );

  return (
    <div className="hacker-news">
      <Header />

      <Search search={search} />

      <div className="stories">
        <h2>Top 15 Hacker News</h2>
        {errorMessage ? (
          <div>{errorMessage}</div>
        ) : isLoading ? (
          <div>Loading...</div>
        ) : (
          storyList
        )}
      </div>
    </div>
  );
};

export default App;
