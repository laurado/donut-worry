import React, { Component } from 'react';

class BakeryShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakery: {}
    }
  }

  render() {
    return (
      <h1>Hello from BakeryShowContainer</h1>
    )
  }
}

export default BakeryShowContainer;
