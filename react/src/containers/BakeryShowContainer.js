import React, { Component } from 'react';
import ReviewTile from '../components/ReviewTile'

class BakeryShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakery: {},
      reviews: []
    }
  }

  componentDidMount() {
    let bakeryId = this.props.params.id
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

        <div className="row bakery-description">
          <div className="columns small-4">
            <img className='show-image' src={this.state.bakery.img_url} alt={this.state.bakery.name}></img>
          </div>
          <div className="columns small-8">
            <h1>{this.state.bakery.name}</h1>
            <h5>{this.state.bakery.address}, {this.state.bakery.city} {this.state.bakery.state}, {this.state.bakery.zip}</h5>
            <p>{this.state.bakery.description}</p>
          </div>
        </div>
        <h3>Reviews</h3>
        {reviews}
        <a className="button" href={`/bakeries/${this.props.params.id}/reviews/new`}>Add New Review</a>
      </div>
    )
  }
}

export default BakeryShowContainer;
