import React from 'react';
import { BrowserRouter as Router, Route, browserHistory } from 'react-router-dom';
import BakeriesIndexContainer from './BakeriesIndexContainer';
import BakeryShowContainer from './BakeryShowContainer'

const App = props => {
  return (
    <Router>
      <div>
        <Route exact path='/' component={BakeriesIndexContainer}/>
        <Route exact path='/bakeries' component={BakeriesIndexContainer}/>
        <Route path='/bakeries/:id' component={BakeryShowContainer}/>
      </div>
    </Router>
  )
}

export default App;
