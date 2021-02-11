import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphotos/actions/fetch_images.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotosPage extends StatefulWidget {
  @override
  State createState() {
    return PhotosPageState();
  }

  PhotosPage({Key key}) : super(key: key);
}

class PhotosPageState extends State<PhotosPage> {
  ScrollController _controller;
  int x = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    print("Fetching images");
    Future.delayed(new Duration(milliseconds: 1500), () {
      ImagesAction.of(context).fetchImages();
      print("Fetched images");
    });
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
            Text("${x}"),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    key: ValueKey(images[index].imageUrl),
                    child: Column(children: [
                      Hero(
                          tag: "PhotoHero",
                          child: GestureDetector(
                            onTap: () => print("tapped"),
                            child: CachedNetworkImage(
                              width: 150,
                              height: 150,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              imageUrl: images[index].imageUrl,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          )),
                      Text(images[index].authorUsername)
                    ]),
                  );
                },
              ),
            )
          ]);
        },
      )),
    );
  }

  void showImageDetails(ImageC imageC) {}

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      //reached bottom , fetch new images
      print("Fetching new images");
      ImagesAction.of(context).fetchImages();
      setState(() {
        x++;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      //reached the top
    }
  }
}
