import React from 'react';
import { render } from '@testing-library/react';
import Stories from './Stories';

describe('Stories', () => {
  it('renders a stories list title', () => {
    const { getByText } = render(<Stories />);

    const listTitle = getByText(/Top 15 Hacker News/);

    expect(listTitle).toBeInTheDocument();
  });
});
