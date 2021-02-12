import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:sphotos/entities/image_e.dart';

class PhotoStore {
  final PublishSubject<List<ImageE>> imagesE$;
  final BehaviorSubject<List<ImageC>> imagesO$ =
      BehaviorSubject.seeded(List<ImageC>.empty(growable: true));
  int _pageNum = 1;
  int _lastFetched = 0;

  int get lastFetched => _lastFetched;

  set lastFetched(int value) {
    _lastFetched = value;
  }

  set pageNum(int value) {
    _pageNum = value;
  }

  int get pageNum => _pageNum;

  PhotoStore(this.imagesE$) {
    imagesE$.listen((imagesE) {
      final newImages = imagesE.map((imageE) {
        ImageC image = ImageC.fromImageE(imageE);
        return image;
      }).toList();
      List<ImageC> currentValue = imagesO$.value.toList(growable: true);
      currentValue.addAll(newImages);
      _lastFetched = pageNum;
      imagesO$.add(currentValue);
      _pageNum += 1;
    });
  }

  void dispose() {
    imagesO$.close();
  }
}
