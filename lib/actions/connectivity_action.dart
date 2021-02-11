import 'package:flutter/material.dart';
import 'package:sphotos/entities/login_history_e.dart';
import 'package:sphotos/providers/utils.dart';
import 'package:sphotos/services/implementations/internet_service.dart';
import 'package:sphotos/services/interfaces/storage_service.dart';
import 'package:sphotos/stores/connection_store.dart';

class ConnectivityAction {
  final ConnectionStore connectionStore;
  final InternetService internetService;
  final StorageService storageService;

  Future<bool> isConnectedToInternet() async {
    LoginHistoryE loginHistory = await storageService.getLoginHistory();
    if(!loginHistory.isFirstTime){

    }
  }

  ConnectivityAction(
      this.internetService, this.connectionStore, this.storageService);

  factory ConnectivityAction.of(BuildContext context) {
    return ConnectivityAction(StaticProvider.of(context),
        StaticProvider.of(context), StaticProvider.of(context));
  }
}
