import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

enum NetworkState {
  CONNECTED, DISCONNECTED, UNKNOWN
}

class Network {

  static var status = NetworkState.UNKNOWN;
  static final Network _shared = Network();


  Network() {

    if(Network.status == NetworkState.UNKNOWN) {
      Connectivity().checkConnectivity().then((ConnectivityResult result) {

        if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
          status = NetworkState.CONNECTED;
        }

      });
    }

    StreamSubscription<ConnectivityResult> subscription;

    Connectivity connectivity = Connectivity();
    subscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {

      if(result == ConnectivityResult.mobile) {
        status = NetworkState.CONNECTED;
      } else if(result == ConnectivityResult.wifi) {
        status = NetworkState.CONNECTED;
      } else {
        status = NetworkState.DISCONNECTED;
      }


    });

  }


}