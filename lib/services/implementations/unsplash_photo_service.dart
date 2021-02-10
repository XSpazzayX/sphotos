import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/entities/image_e.dart';
import 'package:sphotos/services/interfaces/photo_service.dart';

class UnsplashPhotoService implements PhotoService {
  final _apiKey = "2VECU03133zjfwsbibuukS9E1wYOTdvVnsP2CyUqWTk";
  final PublishSubject<List<ImageE>> images$;

  @override
  Future<void> fetchNewImages() async {
    final response = await http.get(
        'https://api.unsplash.com/photos?client_id=$_apiKey&page=1&per_page=5');
    final List<Map<String, dynamic>> images = jsonDecode(response.body);
    List<ImageE> imageList = [for (var image in images) ImageE.fromJson(image)];
    print(imageList);
    images$.add(imageList);
  }

  UnsplashPhotoService(this.images$);
}
