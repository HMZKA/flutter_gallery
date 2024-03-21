import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: ContainerClipper(),
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/board.gif',
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.cloud_upload_fill,
                      size: 25,
                      color: Colors.indigo[400],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Upload Photo',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo[400],
                          fontFamily: 'DynaPuff'),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.quadraticBezierTo(w * 0.5, 160, 0, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
