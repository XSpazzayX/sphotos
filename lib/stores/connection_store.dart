import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/connection_c.dart';
import 'package:sphotos/entities/connection_e.dart';

class ConnectionStore {
  final PublishSubject<ConnectionE> connectionE$;
  final BehaviorSubject<ConnectionC> connectionO$ = BehaviorSubject();

  ConnectionStore(this.connectionE$) {
    connectionO$.add(ConnectionC(false));
    connectionE$.listen((connectionE) {
      ConnectionC connectionC = ConnectionC(connectionE.isConnected);
      connectionO$.add(connectionC);
    });
  }

  void dispose() {
    connectionO$.close();
  }
}
