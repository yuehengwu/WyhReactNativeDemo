/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  AppRegistry,
  Button
} from 'react-native';

class ThrowError extends Component {

  constructor(props,context){
    super(props,context);
    this.state = {
      throwError:false,  
    }
  }

  render(){

    if(this.state.throw){
      throw new Error("Yiya Maya!");
    }
    return(
      <Button title='我们来抛出一个异常' onPress={()=>{
        this.setState({throw:true});
          
         }}>
      </Button>
    )
  }

  componentDidCatch(){
    console.log("子组件:componentDidCatch");
  }

}

class AppText extends React.Component {

  render(){
    return(
      <Text style={styles.welcome}>{this.props.name}</Text>
    );
  }
}

class App extends React.Component {

  render() {

    console.log('render');

    return (
      <View style={styles.container}>
        <AppText name='Im second View!'></AppText>
        <ThrowError></ThrowError> 
      </View>

    );
  }

  componentWillMount(){
    console.log("componentWillMount");
  }
  componentDidMount(){
    console.log("componentDidMount");
  }

  // property will update .
  componentWillReceiveProps(){
    console.log("componentWillReceiveProps");
  }

  shouldComponentUpdate(){
    console.log("shouldComponentUpdate");
    return true;
  }

  componentWillUpdate(){
    console.log("componentWillUpdate");
  }

  componentDidUpdate(){
    console.log("componentDidUpdate");
  }

  
  // dealloc
  componentWillUnmount(){
    console.log("componentWillUnmount");
  }

  // error
  componentDidCatch(error,info){
    console.log('componentDidCatch',error,info);
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    color: '#333333',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('WyhSecondReactNative', () => App);