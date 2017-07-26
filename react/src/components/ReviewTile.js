import React, {Component} from 'react';
import { browserHistory, Link } from 'react-router';
import Upvote from './Upvote';
import Downvote from './Downvote';

class ReviewTile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      votes: this.props.votes,
      upVoteClass: '',
      downVoteClass: ''
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
      this.setState({
        votes: responseData.review.total_votes,
        upVoteClass: responseData.up_style,
        downVoteClass: responseData.down_style
       })
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
      debugger;
      this.setState({
        votes: responseData.review.total_votes,
        upVoteClass: responseData.up_style,
        downVoteClass: responseData.down_style
      })
    })
  }

  render() {
    let editLink = `/bakeries/${this.props.bakery_id}/reviews/${this.props.id}/edit`;

    return(
      <div className="callout" id={this.props.id}>
        <div className="row">
          <div className="columns small-2">
            <div className="upvote-downvote">
              <Upvote style={this.state.upVoteClass} review={this.props.review} handleClick={this.handleUpvoteClick}/>
              <Downvote style={this.state.downVoteClass} review={this.props.review} handleClick={this.handleDownVoteClick}/>
            </div>
            <a href={editLink}>Edit Review</a>
          </div>
          <div className="columns small-10">
            <h5>Rating: {this.props.rating}</h5>
            <h5>Description: {this.props.description}</h5>
            <h5>Votes: {this.state.votes}</h5>
          </div>
        </div>
      </div>
    )
  }
}

export default ReviewTile;
