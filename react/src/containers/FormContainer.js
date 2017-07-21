import React, { Component } from 'react';

class FormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      address: '',
      city: '',
      state: '',
      zip: '',
      description: '',
      img_url: ''
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
  }

  handleChange(event) {
    let value = event.target.value;
    let name = event.target.name;
    this.setState({ [name]: value })
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let formPayload = {
      name: this.state.name,
      address: this.state.address,
      city: this.state.city,
      state: this.state.state,
      zip: this.state.zip,
      description: this.state.description,
      img_url: this.state.img_url
    };
    this.props.addNewBakery(formPayload);
    this.handleClearForm(event);
  };

  handleClearForm(event) {
    event.preventDefault();
    this.setState({
      name: '',
      address: '',
      city: '',
      state: '',
      zip: '',
      description: '',
      img_url: ''
    })
  };

  render() {
    return (
      <form className="callout" onSubmit={this.handleFormSubmit}>
        <TextField
          content={this.state.name}
          label="Name"
          name="Name"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.address}
          label="Address"
          name="Address"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.city}
          label="City"
          name="City"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.state}
          label="State"
          name="State"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.zip}
          label="Zip"
          name="Zip"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.description}
          label="Description"
          name="Description"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.img_url}
          label="Image"
          name="Image"
          handleChange={this.handleChange}
        />
        <div className="button-group">
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default FormContainer;
