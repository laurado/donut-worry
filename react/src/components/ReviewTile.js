import React, {Component} from 'react';
import { browserHistory, Link } from 'react-router';
import Upvote from './Upvote';
import Downvote from './Downvote';

class ReviewTile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      id: this.props.id,
      bakery_id: this.props.bakery_id,
      user_id: this.props.user_id,
      rating: this.props.rating,
      description: this.props.description,
      votes: this.props.votes
    }

    this.handleUpvoteClick = this.handleUpvoteClick.bind(this);
    this.handleDownVoteClick = this.handleDownVoteClick.bind(this);
  }

  handleUpvoteClick(payload){
    fetch(`/api/v1/reviews/${this.props.id}?vote=up`, {
      credentials: 'same-origin',
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: payload
    })
    .then(response => response.json())
    .then(responseData => {
      console.log(responseData)
      this.setState({ total_votes: responseData.review.total_votes })
    })
  }

  handleDownVoteClick(payload){
    fetch(`/api/v1/reviews/${this.props.id}?vote=down`, {
      credentials: 'same-origin',
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: payload
    })
    .then(response => response.json())
    .then(responseData => {
      console.log(responseData)
      this.setState({ total_votes: responseData.review.total_votes })
    })
  }

  render() {
    let editLink = `/bakeries/${this.props.bakery_id}/reviews/${this.props.id}/edit`;
    return(
      <div className="callout" id={this.props.id}>
        <div className="upvote-downvote">
          <Upvote review={this.props.review} handleClick={this.handleUpvoteClick}/>
          <Downvote review={this.props.review} handleClick={this.handleDownVoteClick}/>
        </div>
        <h5>Rating: {this.props.rating}</h5>
        <h5>Description: {this.props.description}</h5>
        <h5>Votes: {this.props.votes}</h5>
        <a href={editLink}>Edit Review</a>
      </div>
    )
  }
}

export default ReviewTile;
