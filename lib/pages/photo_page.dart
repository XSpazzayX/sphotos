import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            child: Hero(
                tag: widget.image,
                child: CachedNetworkImage(
                    fit:BoxFit.cover,imageUrl: widget.image.imageUrl))),
        Padding(
            padding: EdgeInsets.all(12),
            child:Text(
              "${widget.image.description}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),)),
      ]),
    );
  }
}
