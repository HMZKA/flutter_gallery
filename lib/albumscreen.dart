import 'package:flutter/material.dart';

import 'componantes.dart';
import 'images.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          itemExtent: 300,
          perspective: 0.004,
          children: List.generate(
              albums.length, (index) => buildAlbum(albums[index], true))),
    );
  }
}
