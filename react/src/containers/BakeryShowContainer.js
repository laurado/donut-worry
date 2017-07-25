import React, { Component } from 'react';
import { Route, Redirect } from 'react-router';

class BakeryShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakery: {},
      reviews: []
    }
    this.deleteBakery = this.deleteBakery.bind(this)
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

  deleteBakery() {
    let bakeryId = this.props.match.params.id
    fetch(`/api/v1/bakeries/${bakeryId}`, {
      method: "DELETE"
    })
  }


  render() {
    let reviews = this.state.reviews.map(review => {
      return (
        <ReviewTile
          key={review.id}
          rating={review.rating}
          votes={review.votes}
          description={review.description}
        />
      )
    })

    return (
      <div>
        <hr></hr>
        <h1>{this.state.bakery.name}</h1>
        <img className='show-image' src={this.state.bakery.img_url} alt={this.state.bakery.name}></img>
        <h5>{this.state.bakery.address}, {this.state.bakery.city} {this.state.bakery.state}, {this.state.bakery.zip}</h5>
        <p>{this.state.bakery.description}</p>

        <div>

        <a href='/bakeries' onClick={this.deleteBakery} >
          Delete Bakery
        </a>
      </div>

        <h3>Reviews</h3>
        {reviews}

      </div>
    )
  }
}

export default BakeryShowContainer;
