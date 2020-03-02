export const initialState = {
  isLoading: true,
  stories: [],
  errorMessage: null
};

export const reducer = (state, action) => {
  switch (action.type) {
    case 'FETCH_STORIES_REQUEST':
      return {
        ...state,
        isLoading: true,
        errorMessage: null
      };
    case 'FETCH_STORIES_SUCCESS':
      return {
        ...state,
        isLoading: false,
        stories: action.payload
      };
    case 'FETCH_STORIES_FAILURE':
      return {
        ...state,
        isLoading: false,
        errorMessage: action.error
      };
    default:
      return state;
  }
};
