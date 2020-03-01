import React from 'react';
import { render } from '@testing-library/react';
import Search from './Search';

describe('Search', () => {
  it('renders', () => {
    const { asFragment } = render(<Search />);
    expect(asFragment()).toMatchSnapshot();
  });
});
