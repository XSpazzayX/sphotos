import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ConnectionC>(builder: (context, o, _) {
          if (o == null) {
            return Image(
              image: AssetImage("assets/images/camera_background.jpeg"),
              height: double.infinity,
              fit: BoxFit.fill,
            );
          } else if (o.isFirstTime && o.isConnected) {
            StorageAction.of(context).saveLoginFirstTime();
            Future.microtask(() => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PhotosPage())));
            return Image(
              image: AssetImage("assets/images/camera_background.jpeg"),
              height: double.infinity,
              fit: BoxFit.fill,
            );
          } else if (o.isFirstTime && !o.isConnected) {
            return Center(
                child:
                    Text("Please turn on your internet for the first login."));
          } else {
            Future.microtask(() => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PhotosPage())));
            return Image(
              image: AssetImage("assets/images/camera_background.jpeg"),
              height: double.infinity,
              fit: BoxFit.fill,
            );
          }
        }));
  }
}
