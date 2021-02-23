import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/connection_c.dart';
import 'package:sphotos/providers/utils.dart';
import 'package:sphotos/services/implementations/internet_service.dart';
import 'package:sphotos/services/implementations/shared_preferences_service.dart';
import 'package:sphotos/services/interfaces/storage_service.dart';
import 'package:sphotos/stores/connection_store.dart';

class InternetAction{
  final InternetService _internetService;
  final StorageService _storageService;
  final ConnectionStore _connectionStore;
  InternetAction(this._internetService, this._storageService, this._connectionStore);
  factory InternetAction.of(BuildContext context){
    return InternetAction(StaticProvider.of(context),StaticProvider.of(context),StaticProvider.of(context));
  }
  BehaviorSubject<ConnectionC> getConnectionBehaviourSubject(){
      return _connectionStore.connectionO$;
  }

}