import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/connection_c.dart';
import 'package:sphotos/entities/connection_e.dart';
import 'package:sphotos/entities/login_history_e.dart';

class ConnectionStore {
  final BehaviorSubject<ConnectionE> _connectionE$;
  final BehaviorSubject<LoginHistoryE> _loginHistoryE$;
  final BehaviorSubject<ConnectionC> _connectionO$ = BehaviorSubject();

  ConnectionStore(this._connectionE$, this._loginHistoryE$) {
    CombineLatestStream.combine2(
            _connectionE$.stream,
            _loginHistoryE$.stream,
            (ConnectionE connectionE, LoginHistoryE loginHistoryE) =>
                ConnectionC(connectionE.isConnected, loginHistoryE.isFirstTime))
        .listen((connectionC) {
      _connectionO$.add(connectionC);
    });
  }

  void dispose() {
    _connectionO$.close();
  }

  BehaviorSubject<ConnectionC> get connectionO$ => _connectionO$;
}
