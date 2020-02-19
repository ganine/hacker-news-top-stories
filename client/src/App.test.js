import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  const { getByText } = render(<App />);
  const appTitle = getByText(/Hacker News Top Stories/i);
  expect(appTitle).toBeInTheDocument();
});
