import React from 'react';
import { Link } from 'react-router';

const BakeryTile = (props) => {
  let image;
  if (props.img_url === null) {
    image = ""
  } else {
    image = props.img_url
  }

  return(
    <div>
      <Link to={`/bakeries/${props.id}`}>
        <div className="callout">
          <div className='row'>
            <div className='small-2 columns'>
              <img className='index-image' src={image} alt={props.name}></img>
            </div>
            <div className='small-8 columns'>
              <h3>{props.name}</h3>
              <h5>{props.address}, {props.city}, {props.state} {props.zip}</h5>
              <p>{props.description}</p>
            </div>
          </div>
        </div>
      </Link>
    </div>
  )
}

export default BakeryTile;
