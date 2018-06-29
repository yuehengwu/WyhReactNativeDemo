import PropTypes from 'prop-types';
import React, {Component} from 'react';
// import App from './App';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules,
  Button,
  NativeEventEmitter,
  TouchableHighlight,
} from 'react-native';



var WyhBussnessBridgeModule = NativeModules.WyhBussnessBridgeModule;

// const { WyhBussnessBridgeModule } = NativeModules;

const emitter = new NativeEventEmitter(WyhBussnessBridgeModule);

const subscription = emitter.addListener('iOS_Native',(body) => {
  alert(JSON.stringify(body));
  // console.log(JSON.stringify(body));
});

class WyhSecondView extends React.Component {
  static propTypes = {
    title: PropTypes.string.isRequired,
    navigator: PropTypes.object.isRequired,
  }
  render() {
    return (
      <Text style={styles.welcome}>I'm second view!</Text>
    );
  }
}


// Main View
class WyhHighScores extends Component {
  
  static propTypes = {
    title: PropTypes.string.isRequired,
  }

  // life cycle.
  constructor(props,context){
    super(props,context);
    console.log("constructor");
    this.state = {
      wyhState: true,
      showText:'Hidden',
    };
  }

  onButtonPress = () => {
    console.log(WyhBussnessBridgeModule.calender );


    this.setState(previousState=>{
      return { wyhState:!previousState.wyhState };
    });
    this.setState(previousState=>{
      if (previousState.wyhState){
        return {showText:'Hidden'}
      }else {
        return {showText:'Show'}
      }
    })
  };

  _pushNextView =()=>{
    
    // this.props.navigator.push();
  }

  componentWillMount(){
    console.log("componentWillMount");

  }

  render() {
    console.log("render");
    var contents = this.props["scores"].map(
      score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
    );
    let display = this.state.wyhState?contents:'';


    return (
      
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>
          敲代码有出路吗?
        </Text>
        <Text style={styles.scores}>    
          {display}
        </Text>
        <Button onPress={this.onButtonPress} title={this.state.showText}>
        </Button>
        <Button title="JS调用OC" onPress={()=>{
          WyhBussnessBridgeModule.openTestLog('TestModule');
        }}>
          </Button>
          {/* <Button onPress={this._pushNextView} title='Push'>
          </Button>  */}
          
      </View>
    );
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

  // render()

  componentDidUpdate(){
    console.log("componentDidUpdate");
  }

  
  // dealloc
  componentWillUnmount(){
    console.log("componentWillUnmount");
    subscription.remove();
  }

  //error
  componentDidCatch(){
    console.log("componentDidCatch");
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 25,
    fontWeight:'bold',
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('WyhReactNative', () => WyhHighScores);