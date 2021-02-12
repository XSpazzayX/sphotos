import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sphotos/consumables/image_c.dart';

class ListPhotoTile extends StatefulWidget {
  final ImageC image;

  ListPhotoTile({Key key, this.image}) : super(key: key);

  @override
  State createState() {
    return ListPhotoTileState();
  }
}

class ListPhotoTileState extends State<ListPhotoTile> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
         Expanded(
          child:  Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text(
                  widget.image.authorUsername,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
         Container(
          height: 150.0,
          width: 150.0,
          child: Stack(
            children: <Widget>[
               Transform.translate(
                offset:  Offset(50.0, 0.0),
                child:  Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                ),
              ),
               Transform.translate(
                offset: Offset(10.0, 20.0),
                child:  Card(
                  elevation: 20.0,
                  child:  Hero(tag:widget.image,child:Container(
                    height: 120.0,
                    width: 120.0,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 10.0,
                            color: Colors.white,
                            style: BorderStyle.solid),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(widget.image.thumbnailUrl),
                        )),
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
