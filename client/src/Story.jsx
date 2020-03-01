import React from 'react';

const Story = ({
  id,
  title,
  author,
  url,
  publishedAt,
  comments
}) => {
  return (
    <div className="story">
      <div><a href={url} target="_blank">{title}</a></div>
      <div>
        by <a href={author.url} target="_blank">{author.user}</a>
        &nbsp;<a href={comments.url} target="_blank">{publishedAt}</a>
      </div>
      <div></div>
    </div>
  );
};

export default Story;
