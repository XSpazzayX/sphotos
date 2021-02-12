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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 1000,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
                tag: widget.image,
                child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Stack(alignment: Alignment.center, children: [
                          CachedNetworkImage(
                            height: 1000,
                            fit: BoxFit.fill,
                            imageUrl: widget.image.thumbnailUrl,
                          ),
                          Positioned(
                              top: 100,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(),
                              ))
                        ]),
                    fit: BoxFit.cover,
                    imageUrl: widget.image.imageUrl)),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                "${widget.image.description}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              )),
        )
      ],
    ));
  }
}
