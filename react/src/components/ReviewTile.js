import React from 'react';
import Upvote from './Upvote';

const ReviewTile = (props) => {
  return(
    <div>
      <h3>{props.rating}: {props.description}</h3>
      <h4>{props.votes}</h4>
    </div>
  )
}

export default ReviewTile;
