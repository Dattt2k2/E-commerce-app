import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';


@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/image/carousel1.png',
      'assets/image/carousel2.png',
    ];

    final responsive = ResponsiveBreakpoints.of(context);
    final isMobile = responsive.isMobile;
    final isTablet = responsive.isTablet;
    final isDesktop = responsive.isDesktop;



    return Scaffold(
      body: isDesktop 
      ? _buildDeskopLayout(context, images)
      : isMobile
      ? _buildMobileLayout(images)
      : _buildTabletLayout(images),
    );
  }
} 

Widget _buildDeskopLayout(BuildContext context, List<String> images){
  return Row(
    children: [
      Expanded(
        flex: 6,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 16/9,
            viewportFraction: 1,
            enlargeCenterPage: true,
          ),
          items: images.map((e) => Image.asset(e, fit: BoxFit.cover)).toList(),
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to our store",
                style: CustomTextStyle.headlineBig(context),
              ),
              const SizedBox(width:  20,),
              
            ],
          ),
        ),
      )
    ],
  );
}

Widget _buildMobileLayout(List<String> images){
  return Center(
    child: Text("Mobile Layout"),
  );
}

Widget _buildTabletLayout(List<String> images){
  return Center(
    child: Text("Tablet Layout"),
  );
}