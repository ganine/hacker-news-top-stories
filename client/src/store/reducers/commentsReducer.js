const SHOW_COMMENTS_TEXT = '+ Show most relevant comments';
const HIDE_COMMENTS_TEXT = '- Hide most relevant comments';

export const initialState = {
  isVisible: false,
  buttonText: SHOW_COMMENTS_TEXT,
  isLoading: true,
  relevantComments: [],
  errorMessage: null
};

export const reducer = (state, action) => {
  switch (action.type) {
    case 'SHOW_COMMENTS_CONTAINER':
      return {
        ...state,
        isVisible: true,
        buttonText: HIDE_COMMENTS_TEXT
      };
    case 'HIDE_COMMENTS_CONTAINER':
      return {
        ...state,
        isVisible: false,
        buttonText: SHOW_COMMENTS_TEXT 
      };
    case 'FETCH_COMMENTS_REQUEST':
      return {
        ...state,
        isLoading: true,
        errorMessage: null
      };
    case 'FETCH_COMMENTS_SUCCESS':
      return {
        ...state,
        isLoading: false,
        relevantComments: action.payload
      };
    case 'FETCH_COMMENTS_FAILURE':
      return {
        ...state,
        isLoading: false,
        errorMessage: action.error
      };
    default:
      return state;
  }
};
