import React, { Component } from 'react';
import BakeryTile from '../components/BakeryTile';

class BakeriesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakeries: []
    }
  }

  render() {

    let bakeries = this.state.bakeries.map(bakery => {
      return(
        <BakeryTile
          key={bakery.id}
          bakery={bakery}
        />
      )
    })

    return (
      <div>
        <hr/>
        {bakeries}
      </div>
    )
  }
}

export default BakeriesIndexContainer;
