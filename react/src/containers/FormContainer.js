import React, { Component } from 'react';
import TextField from '../components/TextField'

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
    this.handleClearForm = this.handleClearForm.bind(this);
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
  }

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
  }

  render() {

    return (
      <form className="callout" onSubmit={this.handleFormSubmit}>
        <TextField
          content={this.state.name}
          label="Name"
          name="name"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.address}
          label="Address"
          name="address"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.city}
          label="City"
          name="city"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.state}
          label="State"
          name="state"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.zip}
          label="Zip"
          name="zip"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.description}
          label="Description"
          name="description"
          handleChange={this.handleChange}
        />
        <TextField
          content={this.state.img_url}
          label="Image"
          name="img_url"
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
