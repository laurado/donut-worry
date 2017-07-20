import React from 'react';
import { Link } from 'react-router-dom';

const BakeryTile = (props) => {
  return(
    <div>
      <Link to={`/bakeries/${props.bakery.id}`}>
        <div className="callout">
          <div className='row'>
            <div className='small-2 columns'>
              <img className='show-image' src={props.bakery.img_url} alt={props.bakery.name}></img>
            </div>
            <div className='small-8 columns'>
              <h3>{props.bakery.name}</h3>
              <h5>{props.bakery.address}, {props.bakery.city} {props.bakery.state}, {props.bakery.zip}</h5>
              <p>{props.bakery.description}</p>
            </div>
          </div>
        </div>
      </Link>
    </div>
  )
}

export default BakeryTile;
