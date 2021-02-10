import 'package:provider/single_child_widget.dart';
import 'package:sphotos/providers/services.dart';
import 'package:sphotos/providers/stores.dart';
import 'package:sphotos/providers/streams.dart';

import 'observables.dart';

List<SingleChildWidget> providers = [
  ...streams,
  ...services,
  ...stores,
  ...observables
];
