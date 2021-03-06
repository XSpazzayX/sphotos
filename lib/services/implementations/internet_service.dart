import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/entities/connection_e.dart';

class InternetService {
  final BehaviorSubject<ConnectionE> connection$;

  InternetService(this.connection$) {
    DataConnectionChecker()
        .hasConnection
        .then((value) => connection$.add(ConnectionE(value)));
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      var isDeviceConnected;
      if (result != ConnectivityResult.none) {
        isDeviceConnected = await DataConnectionChecker().hasConnection;
      } else {
        isDeviceConnected = false;
      }
      print("Changed connection to $isDeviceConnected");
      connection$.add(ConnectionE(isDeviceConnected));
    });
  }
}
