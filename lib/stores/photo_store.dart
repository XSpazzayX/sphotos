import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:sphotos/entities/image_e.dart';

class PhotoStore {
  final PublishSubject<List<ImageE>> imagesE$;
  final BehaviorSubject<List<ImageC>> imagesO$ =
      BehaviorSubject.seeded(List<ImageC>.empty(growable: true));
  int _pageNum = 1;

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
      imagesO$.add(currentValue);
    });
  }

  void dispose() {
    imagesO$.close();
  }
}
