import React from 'react';
import { Router, Route, browserHistory, IndexRoute } from 'react-router';
import BakeriesIndexContainer from './BakeriesIndexContainer';
import BakeryShowContainer from './BakeryShowContainer'

const App = props => {
  return (
    <Router history={browserHistory}>
      <Route path='/' component={BakeriesIndexContainer}/>
      <Route path='/bakeries' component={BakeriesIndexContainer}/>
      <Route path='/bakeries/:id' component={BakeryShowContainer}/>
    </Router>
  )
}

export default App;
