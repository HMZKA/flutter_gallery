// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gallery/images.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatefulWidget {
  ImageView(this.index, {super.key})
      : pageController = PageController(initialPage: index);
  int index = 0;
  dynamic pageController;
  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PhotoViewGallery.builder(
        pageController: widget.pageController,
        itemCount: images.length,
        builder: (context, index) => PhotoViewGalleryPageOptions(
          imageProvider: AssetImage('${images[index]}'),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 5,
          heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
        ),
      ),
    );
  }
}
