import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:sphotos/entities/image_e.dart';
import 'package:sphotos/services/interfaces/photo_service.dart';

class UnsplashPhotoService implements PhotoService {
  final _apiKey = "2VECU03133zjfwsbibuukS9E1wYOTdvVnsP2CyUqWTk";
  final PublishSubject<List<ImageE>> images$;

  @override
  Future<void> fetchNewImages(int page) async {
    print("In service fetching images");
    final DioCacheManager dioCacheManager = DioCacheManager(CacheConfig(baseUrl: "https://api.unsplash.com/photos"));
    final Options cacheOptions = buildCacheOptions(Duration(days: 7));
    Dio dio = Dio();
    dio.interceptors.add(dioCacheManager.interceptor);
    final response = await dio.get("https://api.unsplash.com/photos",
        queryParameters: {"client_id": _apiKey, "page": page, "per_page": 10},
        options: cacheOptions);
    final List<dynamic> images =
        response.data;
    List<ImageE> imageList = images.map((image){
      return ImageE.fromJson(image);
    }).toList();
    images$.add(imageList);
  }

  UnsplashPhotoService(this.images$) {}
}
