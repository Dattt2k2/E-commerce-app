import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:e_commerce_app/config/theme/theme.dart';
import 'package:e_commerce_app/form/flip_card.dart';
import 'package:e_commerce_app/screen/auth/log_in.dart';
import 'package:e_commerce_app/styles/custom_button.dart';
import 'package:e_commerce_app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:e_commerce_app/config/routes/router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Tạo controller và list hình ảnh ở cấp state để tránh khởi tạo lại
  late CarouselSliderController carouselController;
  final List<String> images = [
    'assets/image/carousel1.png',
    'assets/image/carousel2.png',
  ];

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isMobile = responsive.isMobile;
    final isTablet = responsive.isTablet;
    final isDesktop = responsive.isDesktop;

    return Scaffold(
      body: SafeArea(
        child: isDesktop
            ? _buildDeskopLayout()
            : isMobile
                ? _buildMobileLayout()
                : _buildTabletLayout(),
      ),
    );
  }

  // Layout cho các thiết bị khác nhau
  Widget _buildMobileLayout() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _buildCarousel(aspectRatio: 1/1),
        ),
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: FlipAuthCard(),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _buildCarousel(aspectRatio: 16/9),
        ),
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
            child: FlipAuthCard(),
          ),
        ),
      ],
    );
  }

  Widget _buildDeskopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildCarousel(isFullHeight: true),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 600,
                ),
                child: const FlipAuthCard(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget riêng cho carousel để tái sử dụng
  Widget _buildCarousel({double? aspectRatio, bool isFullHeight = false}) {
    return CarouselSlider(
      carouselController: carouselController, // Sử dụng controller được khởi tạo trong initState
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: aspectRatio ?? 16/9,
        viewportFraction: 1,
        enlargeCenterPage: true,
        height: isFullHeight ? double.infinity : null,
      ),
      items: images.map((e) => Image.asset(
        e,
        fit: BoxFit.cover,
      )).toList(),
    );
  }
}