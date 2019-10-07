import React from 'react';
import {View, Image, StyleSheet, Text} from 'react-native';

import logo from '../assets/logo.png';
import {SafeAreaView} from 'react-navigation';

export default function Main() {
  return (
    <SafeAreaView style={styles.container}>
      <Image source={logo} />

      <View>
        <View style={styles.cardsContainers}>
          <View style={styles.card}>
            <Image
              source={{
                uri: 'https://avatars0.githubusercontent.com/u/38366235?v=4',
              }}
            />
            <View style={styles.footer}>
              <Text style={styles.name}>Vinny Bittencourt</Text>
              <Text style={styles.bio}>Programador Web and Mobile</Text>
            </View>
          </View>
        </View>
      </View>

      <View />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    alignItems: 'center',
    justifyContent: 'space-between',
  },

  cardsContainers: {
    flex: 1,
    alignItems: 'stretch',
    justifyContent: 'center',
    maxHeight: 500,
  },

  card: {
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 8,
    margin: 30,
    overflow: 'hidden',
  },
});
