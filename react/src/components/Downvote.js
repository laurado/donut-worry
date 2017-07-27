import React from 'react';

const Downvote = props => {
  return(
    <button type="button" onClick={props.handleClick}> v </button>
  )
}

export default Downvote;
