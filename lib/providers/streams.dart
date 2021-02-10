import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/entities/images_e.dart';

List<SingleChildWidget> streams = [
  Provider<PublishSubject<List<ImageE>>>(
   lazy:false,
   create:(context) => PublishSubject(sync:true),
   dispose:(_,stream) => stream.close()
  )
];