import React from 'react';

const BakeryTile = (props) => {
  return(
    <div>
      <h3>{props.name}</h3>
      <h4>{props.address}, {props.city} {props.state}, {props.zip}</h4>
      <p>{props.description}</p>
    </div>
  )
}

export default BakeryTile;
