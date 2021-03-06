import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphotos/pages/home_page.dart';
import 'package:sphotos/pages/photos_page.dart';
import 'package:sphotos/providers/provider.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'helpers/ad_manager.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(testDeviceIds:[AdManager.appId]);
  Provider.debugCheckInvalidValueType = <T>(T value) {
    return true;
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
        child: MaterialApp(
            title: 'sphotos',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage()));
  }
}
