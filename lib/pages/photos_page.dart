import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphotos/actions/fetch_images.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sphotos/helpers/ad_manager.dart';
import 'package:sphotos/pages/photo_page.dart';

class PhotosPage extends StatefulWidget {
  @override
  State createState() {
    return PhotosPageState();
  }

  PhotosPage({Key key}) : super(key: key);
}

class PhotosPageState extends State<PhotosPage> {
  ScrollController _controller;
  AdmobInterstitial interstitialAd;
  int timesTapped = 0;
  Future<void> _loadInterstitialAd()async{
    print("loading ad");
    await interstitialAd.isLoaded ? interstitialAd.show() : print("failed to load");
  }
  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      default:
        print(event);
        break;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: AdManager.interstitialAdUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    ImagesAction.of(context).fetchImages();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: Container(child: Consumer<List<ImageC>>(
        builder: (context, images, _) {
          if (images == null) {
            return CircularProgressIndicator();
          } else if (images.length == 0) {
            return Container(child: Text("Empty list"));
          }
          return Column(children: [
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: 20),
                      color: Colors.red,
                      width: double.infinity,
                      height:500,
                      child: GestureDetector(
                          onTap: _handleTap,
                          onLongPress: () => showImageDetails(images[index]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Row(children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    imageUrl: images[index].thumbnailUrl,
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ])),
                              Text("${images[index].authorUsername}"),
                            ],
                          )));
                },
              ),
            )
          ]);
        },
      )),
    );
  }
  void _handleTap() async{
    timesTapped++;
    print("TimesTapped-$timesTapped");
    if(timesTapped == 3){
      await _loadInterstitialAd();
      timesTapped = 0;
    }

  }

  void showImageDetails(ImageC imageC) {
    print("pressed");
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return PhotoPage(image: imageC);
    }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    interstitialAd.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      //reached bottom , fetch new images
      print("Scrolled to bottom");
      ImagesAction.of(context).fetchImages();
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      //reached the top
    }
  }
}
