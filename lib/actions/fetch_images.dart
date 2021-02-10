import 'package:sphotos/services/interfaces/photo_service.dart';
import 'package:sphotos/stores/ad_store.dart';
import 'package:sphotos/stores/photo_store.dart';

class FetchImages{
  //TODO all of this kek
  final PhotoService _photoService;
  final PhotoStore _photoStore;
  final AdStore _adStore;
  //final AdService _adService;

  FetchImages(
      this._photoService, this._photoStore, this._adStore, this._adService);
}