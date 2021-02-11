import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:sphotos/entities/image_e.dart';

class PhotoStore{
  final PublishSubject<List<ImageE>> imagesE$;
  final BehaviorSubject<List<ImageC>> imagesO$ = BehaviorSubject.seeded(List<ImageC>.empty(growable: true));
  int _pageNum = 0;

  int get pageNum => _pageNum;

  PhotoStore(this.imagesE$){
    imagesE$.listen((imagesE){
      final newImages = imagesE.map((imageE){
        ImageC image = ImageC.fromImageE(imageE);
        return image;
      });
      imagesO$.value.addAll(newImages);
      imagesO$.add(imagesO$.value);
      imagesO$.listen((value) {
        print("i got here ${value.length}");
      });
      print("updateObservable");
      _pageNum +=1;
    });
  }
  void dispose(){
    imagesO$.close();
  }
}