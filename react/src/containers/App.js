import React from 'react';
import { BrowserRouter as Router, Route, browserHistory, Switch } from 'react-router-dom';
import BakeriesIndexContainer from './BakeriesIndexContainer';
import BakeryShowContainer from './BakeryShowContainer'
import FormContainer from './FormContainer'

const App = props => {
  return (
    <Router>
      <Switch>
        <Route exact path='/' component={BakeriesIndexContainer}/>
        <Route exact path='/bakeries' component={BakeriesIndexContainer}/>
        <Route exact path='/bakeries/new' component={FormContainer}/>
        <Route path='/bakeries/:id' component={BakeryShowContainer}/>
      </Switch>
    </Router>
  )
}

export default App;
