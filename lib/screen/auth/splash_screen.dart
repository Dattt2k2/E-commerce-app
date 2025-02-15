import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/config/theme/theme.dart';
import 'package:e_commerce_app/styles/custom_button.dart';
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
      body: SafeArea(  // Thêm SafeArea để tránh overflow
        child: isDesktop 
          ? _buildDeskopLayout(context, images)
          : isMobile
            ? _buildMobileLayout(context, images)  // Thêm context parameter
            : _buildTabletLayout(context, images), // Thêm context parameter
      ),
    );
  }
} 

Widget _buildDeskopLayout(BuildContext context, List<String> images) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            child: CarouselSlider(
              options: CarouselOptions(
                // height: MediaQuery.of(context).size.height *0.8,  // Set chiều cao cụ thể
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                enlargeCenterPage: true,
              ),
              items: images.map((e) => Container(
                child: Image.asset(
                  e,
                  fit: BoxFit.cover,
                ),
              )).toList(),
            ),
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
                const SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Log in',
                        onpressed: () { print('ahahaha'); },
                        backgroundColor: Colors.blue.shade100,
                        textColor: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        text: 'Sign up',
                        onpressed: () { print('ahahaha'); },
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

Widget _buildMobileLayout(BuildContext context, List<String> images){
  return Container(
    color: flexSchemeDark.primary,
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: CarouselSlider(
            options: CarouselOptions(
              // height: MediaQuery.of(context).size.height *0.8,  // Set chiều cao cụ thể
              autoPlay: true,
              aspectRatio:1/1,
              viewportFraction: 1,
              enlargeCenterPage: true,
            ),
            items: images.map((e) => Container(
              child: Image.asset(
                e,
                fit: BoxFit.fitWidth,
              ),
            )).toList(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                'Welcome to our shop',
                style: CustomTextStyle.splastTitle(context),
              ),
              SizedBox(height: 30,),
              CustomButton(
              text: 'Log in',
              onpressed: () { print('ahahaha'); },
              backgroundColor: Colors.blue.shade100,
              textColor: Colors.black87,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Sign up',
                onpressed: () { print('ahahaha'); },
                backgroundColor: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildTabletLayout(BuildContext context ,List<String> images){
  return Center(
    child: Text("Tablet Layout"),
  );
}