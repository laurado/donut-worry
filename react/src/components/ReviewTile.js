import React from 'react';
import Upvote from './Upvote';

const ReviewTile = (props) => {
  return(
    <div className="callout">
      <h5>Rating: {props.review.rating}</h5>
      <h5>Description: {props.review.description}</h5>
      <h5>Votes: {props.review.votes}</h5>
    </div>
  )
}

export default ReviewTile;
