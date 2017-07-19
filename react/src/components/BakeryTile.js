import React from 'react';

const BakeryTile = (props) => {
  return(
    <div>
      <h3>{props.bakery.name}</h3>
      <h4>{props.bakery.address}, {props.bakery.city} {props.bakery.state}, {props.bakery.zip}</h4>
      <p>{props.bakery.description}</p>
    </div>
  )
}

export default BakeryTile;
