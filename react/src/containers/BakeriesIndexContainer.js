import React, { Component } from 'react';

class BakeriesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakeries: []
    }
  }

  render() {
    return (
      <h1>hello from BakeriesIndexContainer</h1>
    )
  }
}

export default BakeriesIndexContainer;
