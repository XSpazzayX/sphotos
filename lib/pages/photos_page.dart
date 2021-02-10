import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphotos/consumables/image_c.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotosPage extends StatefulWidget {
  @override
  State createState() {
    return PhotosPageState();
  }
}

class PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ImageC>>(
      builder: (context, images, child) {
        return ListView.builder(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: GestureDetector(
                    onTap: () {
                      showImageDetails(images[index]);
                    },
                    child: Hero(
                        tag: "PhotoHero",
                        child: CachedNetworkImage(
                          width: 150,
                          height: 150,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          imageUrl: images[index].imageUrl,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ))));
          },
        );
      },
    );
  }

  void showImageDetails(ImageC imageC) {}
}
