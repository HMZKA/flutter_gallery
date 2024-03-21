import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_gallery/albumscreen.dart';
import 'package:flutter_gallery/homescreen.dart';
import 'package:flutter_gallery/photoscreen.dart';
import 'package:iconly/iconly.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var advancedDrawerController = AdvancedDrawerController();
  final gradient = const LinearGradient(
    colors: [
      Colors.blueAccent,
      Colors.yellow,
      Colors.orange,
      Colors.pinkAccent
    ],
  );
  List screens = [const HomeScreen(), const AlbumScreen(), const PhotoScreen()];
  var screencontroller = PageController();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 25,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(bounds),
            child: const Text('Photo Art',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DynaPuff')),
          ),
          iconTheme: const IconThemeData(size: 25, color: Colors.pinkAccent),
          // shape: RoundedRectangleBorder(
          //     side: BorderSide(
          //         width: 10, style: BorderStyle.none, color: Colors.white),
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(35),
          //         bottomLeft: Radius.circular(35))),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
        ),
        drawer: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            clipBehavior: Clip.antiAlias,
            child: Drawer(
              backgroundColor: Colors.black54,
              child: Container(),
            )),
        bottomNavigationBar: BottomNavyBar(
          containerHeight: 62,
          curve: Curves.fastLinearToSlowEaseIn,
          animationDuration: const Duration(seconds: 2),
          backgroundColor: Colors.black,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          items: [
            BottomNavyBarItem(
                icon: const Icon(
                  IconlyBold.home,
                ),
                title: const Text(
                  'Home',
                  style: TextStyle(fontFamily: 'DynaPuff'),
                ),
                activeColor: Colors.yellow,
                inactiveColor: Colors.amber),
            BottomNavyBarItem(
                icon: const Icon(
                  IconlyBold.category,
                ),
                title: const Text(
                  'Albums',
                  style: TextStyle(fontFamily: 'DynaPuff'),
                ),
                activeColor: Colors.yellow,
                inactiveColor: Colors.amber),
            BottomNavyBarItem(
                icon: const Icon(
                  IconlyBold.image_2,
                ),
                title: const Text('Photos',
                    style: TextStyle(fontFamily: 'DynaPuff')),
                activeColor: Colors.yellow,
                inactiveColor: Colors.amber),
          ],
          onItemSelected: (value) {
            setState(() {
              screencontroller.animateToPage(value,
                  duration: const Duration(milliseconds: 950),
                  curve: Curves.easeOut);
            });
          },
          selectedIndex: index,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 220, 209, 209),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            controller: screencontroller,
            itemCount: 3,
            itemBuilder: (context, index) => screens[index],
          ),
        ));
  }
}
