import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselPage extends StatelessWidget {
  
  Widget build(BuildContext context){
    return ImageCarousel(); 
  }
}

class ImageCarousel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     MediaQuery.of(context).size.height;

    return new Stack(
      children: <Widget>[
        SizedBox(
               child: new Carousel(
                    images: [
                AssetImage('assets/c.jpg'),
                AssetImage('assets/d.jpg'),
                AssetImage('assets/b.jpg'),
                AssetImage('assets/a.jpg'),
             ],
             animationCurve: Curves.fastOutSlowIn,
             animationDuration:Duration(milliseconds: 3000),
    ),),
       
        
         
         Container(
           decoration: BoxDecoration(
             gradient: new LinearGradient(
              colors: [
                const Color(0xFF047B7B).withOpacity(0.50),
                const Color(0xFF003077).withOpacity(0.88)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
           ),
         ),
        
         Container(
           decoration: BoxDecoration(
          color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
        ),
        height: 60.0,
      
    ) ]  );
    
  }
  
}