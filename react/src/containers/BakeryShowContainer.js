import React, { Component } from 'react';

class BakeryShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakery: {
        name: "Union Square Donuts",
        address: "20 Bow Street",
        city: "Somerville",
        state: "MA",
        zip: "02142",
        description: "This place has the best donuts, trust me. All the other donut shops are fake donut shops. SAD!"
      }
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
