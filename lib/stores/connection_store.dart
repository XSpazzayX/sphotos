import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/connection_c.dart';
import 'package:sphotos/entities/connection_e.dart';
import 'package:sphotos/entities/login_history_e.dart';

class ConnectionStore {
  final BehaviorSubject<ConnectionE> connectionE$;
  final BehaviorSubject<LoginHistoryE> loginHistoryE$;
  final BehaviorSubject<ConnectionC> connectionO$ = BehaviorSubject();

  ConnectionStore(this.connectionE$, this.loginHistoryE$) {
    CombineLatestStream.combine2(
            connectionE$.stream,
            loginHistoryE$.stream,
            (ConnectionE connectionE, LoginHistoryE loginHistoryE) =>
                ConnectionC(connectionE.isConnected, loginHistoryE.isFirstTime))
        .listen((connectionC) {
      connectionO$.add(connectionC);
    });
  }

  void dispose() {
    connectionO$.close();
  }
}
