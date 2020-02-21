// jest-dom adds custom jest matchers for asserting on DOM nodes.
// allows you to do things like:
// expect(element).toHaveTextContent(/react/i)
// learn more: https://github.com/testing-library/jest-dom
import '@testing-library/jest-dom/extend-expect';

// adds context keyword back
// https://github.com/facebook/jest/issues/2468#issuecomment-269718083
global.context = describe;