import 'package:flutter/material.dart';
import 'package:flutter_gallery/photoview.dart';

import '/images.dart';

buildAlbum(model, wheel) => Container(
      width: wheel ? 400 : 200,
      height: double.infinity,
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 0),
              blurStyle: BlurStyle.outer,
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 0),
              blurStyle: BlurStyle.outer,
              blurRadius: 3,
            ),
          ],
          backgroundBlendMode: BlendMode.darken),
      child: Stack(
        alignment: wheel ? Alignment.center : Alignment.bottomLeft,
        children: [
          Image(
            image: AssetImage(
              '${model['image']}',
            ),
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const Image(
                        isAntiAlias: true,
                        width: double.infinity,
                        image: AssetImage('assets/images/gallery.gif'),
                        fit: BoxFit.cover,
                      ),
            errorBuilder: (context, error, stackTrace) => const Image(
              width: double.infinity,
              image: AssetImage('assets/images/gallery.gif'),
              fit: BoxFit.cover,
            ),
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${model['title']}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'DynaPuff',
                  fontSize: wheel ? 36 : 18,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );

buildPhoto(index, context, asset) => InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ImageView(index)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          '${images[index]}',
          fit: BoxFit.cover,
        ),
      ),
    );
