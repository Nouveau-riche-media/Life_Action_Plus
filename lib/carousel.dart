import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ImageCarousel(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next),
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed('login');
          }),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
    return new Container(
      child: new Carousel(
        images: [
          AssetImage('assets/c.jpg'),
          AssetImage('assets/d.jpg'),
          AssetImage('assets/b.jpg'),
          AssetImage('assets/a.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 3000),
      ),
    );
  }
}
