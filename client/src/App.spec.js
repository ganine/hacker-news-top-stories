import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

describe('App', () => {
  it('renders page title', () => {
    const { getByText } = render(<App />);

    const appTitle = getByText(/Top 15 Hacker News/);

    expect(appTitle).toBeInTheDocument();
  });
});
