import React, { Component } from 'react';

class BakeryShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakery: {},
      reviews: []
    }
  }

  componentDidMount() {
    let bakeryId = this.props.match.params.id
    fetch(`/api/v1/bakeries/${bakeryId}`)
    .then(response => response.json())
    .then(body => {
      this.setState({
        bakery: body.bakery,
        reviews: body.reviews
      })
    })
  }

  render() {
    console.log(this.state.bakery)
    console.log(this.state.reviews)

    return (
      <div>
        <hr></hr>
        <h1>{this.state.bakery.name}</h1>
        <h5>{this.state.bakery.address}, {this.state.bakery.city} {this.state.bakery.state}, {this.state.bakery.zip}</h5>
        <p>{this.state.bakery.description}</p>
      </div>
    )
  }
}

export default BakeryShowContainer;
