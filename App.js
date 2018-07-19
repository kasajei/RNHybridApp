/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { Platform, StyleSheet, Text, View, Button } from 'react-native';
import { createStackNavigator, HeaderBackButton } from 'react-navigation';
import { NativeModules } from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

class HomeScreen extends Component {
  static navigationOptions = ({ navigation }) => {
    return {
      title: "HomeScreen",
      headerLeft:
        <HeaderBackButton
          title="Back"
          onPress={() => {
            NativeModules.ReactNativeViewController.goBack()
          }}
        />,
    }
  }
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>To get started, edit App.js</Text>
        <Text style={styles.instructions}>{instructions}</Text>
        <Text style={styles.instructions}>This value is from Native :{this.props.screenProps.fromNative}</Text>
        <Button
          onPress={() => { this.props.navigation.navigate("NextScreen") }}
          title="Go to NextScreen"
          color="#841584"
        />
      </View>
    )
  }
}

class NextScreen extends Component {
  static navigationOptions = ({ navigation }) => {
    return {
      title: "NextScreen"
    }
  }
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>This screen is NextScreen!</Text>
        <Text style={styles.instructions}>You did move!</Text>
        <Text style={styles.instructions}>This value is also from Native :{this.props.screenProps.fromNative}</Text>
      </View>
    )
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
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});


const RootStack = createStackNavigator(
  {
    HomeScreen: HomeScreen,
    NextScreen: NextScreen,
  },
  {
    initialRouteName: 'HomeScreen',
  }
)

class App extends Component {
  componentWillMount() {
    console.log("will mount", this.props)
  }
  render() {
    return <RootStack screenProps={this.props} />
  }
}

export default App