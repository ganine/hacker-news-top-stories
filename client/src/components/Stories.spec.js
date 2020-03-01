import React from 'react';
import { wait, render } from '@testing-library/react';
import Stories from './Stories';
import axios from 'axios';

jest.mock('axios');

describe('Stories', () => {
  it('renders title', () => {
    axios.get.mockResolvedValue({ data: [] });

    const { getByText } = render(<Stories />);

    const listTitle = getByText(/Top 15 Hacker News/);

    expect(listTitle).toBeInTheDocument();
  });

  it('renders loading indicator', () => {
    jest.spyOn(Stories.prototype, 'fetchData').mockImplementationOnce();

    const { getByText } = render(<Stories />);
    const loadingMessage = getByText(/Loading/i);

    expect(loadingMessage).toBeInTheDocument();
  })

  it('renders a stories list', async () => {
    const story = { id: 1, title: 'Vel et quaerat ut.' };
    axios.get.mockResolvedValue({ data: [story] });

    const { getByText } = render(<Stories />);

    await wait(() => {
      expect(getByText(story.title)).toBeInTheDocument();
    });
  });

  context('when the api request fails', () => {
    it('renders an error message', async () => {
      axios.get.mockImplementation(() =>
        Promise.reject({ message: 'Network Error' })
      );

      const { getByText } = render(<Stories />);

      await wait(() => {
        const errorMessage = getByText(/Network Error/);
        expect(errorMessage).toBeInTheDocument();
      });
    });
  });
});
