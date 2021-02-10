import 'package:rxdart/rxdart.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:sphotos/entities/image_e.dart';

class PhotoStore{
  final PublishSubject<List<ImageE>> imagesE$;
  final BehaviorSubject<List<ImageC>> imagesO$ = BehaviorSubject();

  PhotoStore(this.imagesE$){
    imagesO$.add(List<ImageC>.empty(growable: true));
    imagesE$.listen((imagesE){
      final newImages = imagesE.map((imageE){
        ImageC image = ImageC.fromImageE(imageE);
        return image;
      });
      imagesO$.value.addAll(newImages);
    });
  }
  void dispose(){
    imagesE$.close();
  }
}