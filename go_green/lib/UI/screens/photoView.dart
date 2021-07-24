import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatelessWidget {
  static String id = 'PhotoScreen';
  final imgList;

  const PhotoViewScreen({Key? key, this.imgList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: PhotoViewGallery.builder(
        backgroundDecoration: BoxDecoration(color: CupertinoColors.white),
        itemCount: imgList.length,
        builder: (context, int index) {
          return PhotoViewGalleryPageOptions(
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.contained * 1.5,
              imageProvider: NetworkImage(imgList[index]));
        },
      ),
    );
  }
}
