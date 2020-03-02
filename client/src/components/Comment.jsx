import React from 'react';

const Comment = ({ author, publishedAt, content, url }) => {

  return (
    <div className="comment">
      <div>
        by{' '}
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
      <div>
        {content}
      </div>
    </div>
  );
};

export default Comment;
