import React from 'react';

const Story = ({ title, author, url, publishedAt, comments }) => {
  return (
    <div className="story">
      <div className="story-title">
        <a href={url} target="_blank" rel="noopener noreferrer">
          {title}
        </a>
      </div>
      <div>
        by{' '}
        <a className="story-author" href={author.url} target="_blank" rel="noopener noreferrer">
          {author.user}
        </a>
        &nbsp;
        <a className="story-publication" href={comments.url} target="_blank" rel="noopener noreferrer">
          {publishedAt}
        </a>
      </div>
      <div></div>
    </div>
  );
};

export default Story;
