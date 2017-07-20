import React from 'react';
import { Link } from 'react-router-dom';

const BakeryTile = (props) => {
  return(
    <div className="bakery-tile">
      <Link to={`/bakeries/${props.bakery.id}`}>
        <h3>{props.bakery.name}</h3>
        <h5>{props.bakery.address}, {props.bakery.city} {props.bakery.state}, {props.bakery.zip}</h5>
        <p>{props.bakery.description}</p>
        <img src={props.bakery.img_url} alt={props.bakery.name}></img>
      </Link>
    </div>
  )
}

export default BakeryTile;
