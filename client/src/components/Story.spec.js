import React from 'react';
import { render } from '@testing-library/react';
import Story from './Story';

describe('Story', () => {
  it('renders', () => {
    const story = {
      id: 22460018,
      title: 'Epistemic standards for “Why did it take so long to invent X?”',
      author: {
        user: 'jasoncrawford',
        url: 'https://news.ycombinator.com/user?id=jasoncrawford'
      },
      publishedAt: '03/01/2020 23:01',
      url:
        'https://rootsofprogress.org/epistemic-standards-for-why-it-took-so-long',
      comments: {
        url: 'https://news.ycombinator.com/item?id=22460018'
      }
    };

    const { asFragment } = render(<Story {...story} />);
    expect(asFragment()).toMatchSnapshot();
  });
});
