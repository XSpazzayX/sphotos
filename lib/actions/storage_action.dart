
import 'package:flutter/material.dart';
import 'package:sphotos/entities/login_history_e.dart';
import 'package:sphotos/providers/utils.dart';
import 'package:sphotos/services/implementations/internet_service.dart';
import 'package:sphotos/services/interfaces/storage_service.dart';
import 'package:sphotos/stores/connection_store.dart';

class StorageAction {
  final StorageService storageService;

  Future<void> saveLoginFirstTime() async {
    storageService.saveLoginFirstTime();
  }

  StorageAction(this.storageService);

  factory StorageAction.of(BuildContext context) {
    return StorageAction(StaticProvider.of(context));
  }
}
