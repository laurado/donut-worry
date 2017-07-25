import React, {Component} from 'react';

class Downvote extends Component {
  constructor(props) {
    super(props);

    this.handleDownvoteSubmit = this.handleDownvoteSubmit.bind(this)
  }
  handleDownvoteSubmit(event){
    event.preventDefault()
    this.props.handleClick(this.props.review);
  }
  render() {
    return(
      <form onSubmit={this.handleDownvoteSubmit}>
        <button className='button' type='submit'> <i className="fa fa-thumbs-down fa-lg" aria-hidden="true"></i> </button>
      </form>
    );
  }
}
export default Downvote;
