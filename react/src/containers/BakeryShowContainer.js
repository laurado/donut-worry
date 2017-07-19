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
      <div>
        <hr></hr>
        <h4>{this.state.bakery.address}, {this.state.bakery.city} {this.state.bakery.state}, {this.state.bakery.zip}</h4>
        <p>{this.state.bakery.description}</p>
      </div>
    )
  }
}

export default BakeryShowContainer;
