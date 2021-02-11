import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sphotos/providers/utils.dart';
import 'package:sphotos/stores/connection_store.dart';
import 'package:sphotos/stores/photo_store.dart';

List<SingleChildWidget> stores = [
  Provider<PhotoStore>(
    lazy: false,
    create: (context) => PhotoStore(StaticProvider.of(context)),
    dispose: (_, store) => store.dispose(),
  ),
  Provider<ConnectionStore>(
      lazy: false,
      create: (context) => ConnectionStore(StaticProvider.of(context),StaticProvider.of(context)),
      dispose: (_, store) => store.dispose()
  ),
];
