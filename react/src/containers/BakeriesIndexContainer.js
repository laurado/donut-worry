import React, { Component } from 'react';
import BakeryTile from '../components/BakeryTile';

class BakeriesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakeries: [{
        id: 1,
        name: "Union Square Donuts",
        address: "20 Bow Street",
        city: "Somerville",
        state: "MA",
        zip: "02142",
        description: "This place has the best donuts, trust me. All the other donut shops are fake donut shops. SAD!"
      },
        {
        id: 2,
        name: "Dunkin Donuts",
        address: "EVERYWHERE",
        city: "ALL OF THEM",
        state: "Born in MA, but everywhere",
        zip: "Kind of unneccesary at this point",
        description: "America runs on subpar coffee!"
        }
      ]
    }
  }

  render() {

    let bakeries = this.state.bakeries.map(bakery => {
      return(
        <BakeryTile
          key={bakery.id}
          id={bakery.id}
          name={bakery.name}
          address={bakery.address}
          city={bakery.city}
          state={bakery.state}
          zip={bakery.zip}
          description={bakery.description}
        />
      )
    })

    return (
      <div>
        <h1>Donut Worry, Be Happy!</h1>
        <hr/>
        {bakeries}
      </div>
    )
  }
}

export default BakeriesIndexContainer;
