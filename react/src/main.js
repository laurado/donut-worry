import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './containers/App'

let reactElement = document.getElementById('app')

if (reactElement) {
  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <App />,
      reactElement
    );
  })
}
