import React, { Component } from 'react';
import BakeryTile from '../components/BakeryTile';

class BakeriesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bakeries: []
    }
    this.addNewBakery = this.addNewBakery.bind(this)
  }

  componentDidMount() {
    fetch('/api/v1/bakeries')
    .then(response => response.json())
    .then(body => {
      this.setState({ bakeries: body.bakeries })
    })
  }

  addNewBakery(formPayload) {
    fetch('/api/v1/bakeries', {
      method: 'POST',
      body: JSON.stringify(formPayload)
    })
    .then(response => response.json())
    .then(responseData => {
      this.setState({ bakeries: [...this.state.bakeries, responseData] })
    })
  }

  render() {
    let addNewBakery = (formPayload) => this.addNewBakery(formPayload)

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
          img_url={bakery.img_url}
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
