import React, { Component } from 'react';
import { Route, Redirect } from 'react-router';
import ReviewTile from '../components/ReviewTile';

class BakeryShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakery: {},
      reviews: []
    }
    this.deleteBakery = this.deleteBakery.bind(this),
    this.adminBakeryDelete = this.adminBakeryDelete.bind(this)
  }

  componentDidMount() {
    let bakeryId = this.props.params.id
    fetch(`/api/v1/bakeries/${bakeryId}`, {
      credentials: 'same-origin'
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        bakery: body.bakery,
        reviews: body.reviews
      })
    })
  }

  deleteBakery() {
    let bakeryId = this.props.params.id
    fetch(`/api/v1/bakeries/${bakeryId}`, {
      method: "DELETE"
    })
  }

  adminBakeryDelete() {
    if (current_user.admin === true) {
      adminDelete =
      <a href='/bakeries' onClick={this.deleteBakery} >
        Delete Bakery
      </a>;
    }
  }

  render() {
    let adminBakeryDelete;
    let bakeryId = this.props.params.id
    let reviews = this.state.reviews.map(review => {
      return (
        <ReviewTile
          key={review.id}
          id={review.id}
          bakery_id={review.bakery_id}
          user_id={review.user_id}
          rating={review.rating}
          votes={review.total_votes}
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

          <div className="columns small-8 callout">
              <h1>{this.state.bakery.name}</h1>
              <h5>{this.state.bakery.address}, {this.state.bakery.city} {this.state.bakery.state}, {this.state.bakery.zip}</h5>
              <p>{this.state.bakery.description}</p>
          </div>
        </div>
        <div>{this.adminBakeryDelete}</div>
        {reviews}
        <a className="button" href={`/bakeries/${this.props.params.id}/reviews/new`}>Add New Review</a>
      </div>
    )
  }
}

export default BakeryShowContainer;
