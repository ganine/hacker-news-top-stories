import React, { useReducer } from 'react';
import { initialState, reducer } from '../store/reducers/commentsReducer';
import axios from 'axios';
import Comment from './Comment';

import './Story.css';

const Story = ({ id, title, author, url, publishedAt, comments }) => {
  const [state, dispatch] = useReducer(reducer, initialState);

  const {
    isVisible,
    buttonText,
    relevantComments,
    errorMessage,
    isLoading
  } = state;

  const toggleCommentsVisibility = () => {
    if (isVisible) {
      dispatch({ type: 'HIDE_COMMENTS_CONTAINER' });
    } else {
      dispatch({ type: 'SHOW_COMMENTS_CONTAINER' });
    }
  };

  const showComments = () => {
    toggleCommentsVisibility();

    if (relevantComments.length === 0) {
      fetchComments(id);
    }
  };

  const fetchComments = storyId => {
    dispatch({ type: 'FETCH_COMMENTS_REQUEST' });

    axios.get(`/api/stories/${storyId}/comments`).then(
      result => {
        dispatch({
          type: 'FETCH_COMMENTS_SUCCESS',
          payload: result.data
        });
      },
      error => {
        dispatch({
          type: 'FETCH_COMMENTS_FAILURE',
          error: error.message
        });
      }
    );
  };

  const commentList = (
    <ol>
      {relevantComments.map(comment => (
        <li key={comment.id}>
          <Comment {...comment} />
        </li>
      ))}
    </ol>
  );

  return (
    <div className="story">
      <a
        className="story-title"
        href={url}
        target="_blank"
        rel="noopener noreferrer"
      >
        {title}
      </a>
      <div className="story-subtitle">
        by{' '}
        <a
          className="story-author"
          href={author.url}
          target="_blank"
          rel="noopener noreferrer"
        >
          {author.user}
        </a>
        &nbsp;
        <a
          className="story-publication"
          href={comments.url}
          target="_blank"
          rel="noopener noreferrer"
        >
          {publishedAt}
        </a>
      </div>
      <div className="story-comments-count">{85} comments</div>
      <div className="story-comments">
        <button className="story-comments-button" onClick={showComments}>
          {buttonText}
        </button>
        {isVisible && (
          <div className="story-comments-list">
            <hr />
            {errorMessage ? (
              <div>{errorMessage}</div>
            ) : isLoading ? (
              <div>Loading...</div>
            ) : (
              commentList
            )}
          </div>
        )}
      </div>
    </div>
  );
};

export default Story;
