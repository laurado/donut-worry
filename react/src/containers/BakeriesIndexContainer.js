import React, { Component } from 'react';
import BakeryTile from '../components/BakeryTile';

class BakeriesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakeries: []
    }
  }
  componentDidMount() {
    fetch('/api/v1/bakeries')
    .then(response => response.json())
    .then(body => {
      this.setState({ bakeries: body.bakeries })
    })
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
        {bakeries}
      </div>
    )
  }
}

export default BakeriesIndexContainer;
