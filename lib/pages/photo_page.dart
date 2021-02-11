import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../consumables/image_c.dart';

class PhotoPage extends StatefulWidget {
  final ImageC image;

  PhotoPage({this.image});

  @override
  State createState() {
    return PhotoPageState();
  }
}

class PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Hero(
            tag: "PhotoHero",
            child: CachedNetworkImage(
                width: 150, height: 150, imageUrl: widget.image.imageUrl)),
        Text("${widget.image.authorUsername}")
      ]),
    );
  }
}
