import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StaticProvider{
  static T of<T>(BuildContext context) => Provider.of<T>(context,listen:false);
}