import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

describe('App', () => {
  it('renders app title', () => {
    const { getByText } = render(<App />);

    const header = getByText('Hacker News', { exact: true });

    expect(header).toBeInTheDocument();
  });
});
