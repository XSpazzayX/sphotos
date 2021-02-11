import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sphotos/providers/utils.dart';
import 'package:sphotos/services/implementations/internet_service.dart';
import 'package:sphotos/services/implementations/shared_preferences_service.dart';
import 'package:sphotos/services/implementations/unsplash_photo_service.dart';
import 'package:sphotos/services/interfaces/photo_service.dart';
import 'package:sphotos/services/interfaces/storage_service.dart';

List<SingleChildWidget> services = [
  Provider<PhotoService>(
    lazy:false,
    create: (context) => UnsplashPhotoService(StaticProvider.of(context)),
  ),
  Provider<InternetService>(
    lazy:false,
    create:(context) => InternetService(StaticProvider.of(context)),
  ),
  Provider<StorageService>(
    lazy:false,
    create: (context) => SharedPreferencesService(StaticProvider.of(context)),
  )
];