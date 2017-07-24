import React from 'react';
import Upvote from './Upvote';

const ReviewTile = (props) => {
  return(
    <div className="callout" id={props.id}>
      <h5>Rating: {props.rating}</h5>
      <h5>Description: {props.description}</h5>
      <h5>Votes: {props.votes}</h5>
    </div>
  )
}

export default ReviewTile;
