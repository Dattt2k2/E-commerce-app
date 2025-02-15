import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> images = [
      'assets/image/carousel1.png',
      'assets/image/carousel2.jpg',
    ];

    return Scaffold(
      body:  Stack(
        children: [
          CarouselSlider(
            options:  CarouselOptions(
              height: MediaQuery.of(context).size.height *0.6,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16/9,
              viewportFraction: 1.0
            ),
            items: images.map((item) => Container(
              child: Center(child: Image.asset(item, fit: BoxFit.cover, width: double.infinity),),
            )).toList(),
          )
        ],
      ),
    );
  }
}