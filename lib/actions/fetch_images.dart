import 'package:flutter/material.dart';
import 'package:sphotos/providers/utils.dart';
import 'package:sphotos/services/interfaces/photo_service.dart';
import 'package:sphotos/stores/ad_store.dart';
import 'package:sphotos/stores/photo_store.dart';

class ImagesAction {
  final PhotoService _photoService;
  final PhotoStore _photoStore;

  ImagesAction(this._photoService, this._photoStore);
  factory ImagesAction.of(BuildContext context){
    return ImagesAction(StaticProvider.of(context),StaticProvider.of(context));
  }
  Future<void> fetchImages() async{
      _photoService.fetchNewImages();
  }
}
