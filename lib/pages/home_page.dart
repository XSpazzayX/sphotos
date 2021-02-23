import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphotos/actions/internet_action.dart';
import 'package:sphotos/actions/storage_action.dart';
import 'package:sphotos/consumables/connection_c.dart';
import 'package:sphotos/pages/photos_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InternetAction.of(context).getConnectionBehaviourSubject().listen((value) {
      handleConnectionChange(value);
    });
  }

  void handleConnectionChange(ConnectionC connectionC) {
    if (connectionC.isFirstTime && !connectionC.isConnected) {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                  title: Text("Internet"),
                  content: Text("Please turn on your internet"),
                  actions: [
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    )
                  ]));
    } else if (connectionC.isFirstTime && connectionC.isConnected) {
      StorageAction.of(context).saveLoginFirstTime();
    } else {
      Future.delayed(
          Duration(milliseconds: 1200),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PhotosPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage("assets/images/camera_background.jpeg"),
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
