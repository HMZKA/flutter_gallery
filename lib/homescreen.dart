import 'package:flutter/material.dart';
import 'package:flutter_gallery/images.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'componantes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Albums',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'IndieFlower',
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildAlbum(albums[index], false),
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 8, left: 13.5),
              child: Text(
                'Photos',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'IndieFlower',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 2.5,
              mainAxisSpacing: 2.5,
              itemBuilder: (context, index) =>
                  buildPhoto(index, context, images[index]),
              staggeredTileBuilder: (index) => index % 7 == 0
                  ? const StaggeredTile.count(2, 2)
                  : const StaggeredTile.count(1, 1),
              itemCount: images.length,
              physics: const NeverScrollableScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
