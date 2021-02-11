import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/entities/connection_e.dart';
import 'package:sphotos/entities/image_e.dart';
import 'package:sphotos/entities/login_history_e.dart';

List<SingleChildWidget> streams = [
  Provider<PublishSubject<List<ImageE>>>(
      lazy: false,
      create: (context) => PublishSubject(sync: true),
      dispose: (_, stream) => stream.close()),
  Provider<BehaviorSubject<ConnectionE>>(
      lazy: false,
      create: (context) => BehaviorSubject(sync: true),
      dispose: (_, stream) => stream.close()),
  Provider<BehaviorSubject<LoginHistoryE>>(
    lazy:false,
    create: (context) =>BehaviorSubject(sync:true),
    dispose: (_,stream) => stream.close(),
  )
];
