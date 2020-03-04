import React from 'react';

import './Comment.css';

const Comment = ({ author, publishedAt, content, url }) => {
  return (
    <div className="comment">
      <div className="comment-data">
        <a
          className="comment-author"
          href={author.url}
          target="_blank"
          rel="noopener noreferrer"
        >
          {author.user}
        </a>
        &nbsp;
        <a
          className="comment-publication"
          href={url}
          target="_blank"
          rel="noopener noreferrer"
        >
          {publishedAt}
        </a>
      </div>
      <div dangerouslySetInnerHTML={{ __html: content }} />
    </div>
  );
};

export default Comment;
