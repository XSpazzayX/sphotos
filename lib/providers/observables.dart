import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sphotos/consumables/connection_c.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:sphotos/stores/photo_store.dart';
import 'package:sphotos/stores/connection_store.dart';

List<SingleChildWidget> observables = [
  StreamProvider<List<ImageC>>(
    create: (context) => Provider.of<PhotoStore>(context,listen: false).imagesO$,
    lazy: false,
  ),
  StreamProvider<ConnectionC>(
  create:(context) => Provider.of<ConnectionStore>(context,listen: false).connectionO$,
    lazy: false,
  )
];