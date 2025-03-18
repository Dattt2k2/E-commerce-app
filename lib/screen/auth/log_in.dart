import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/form/auth_form.dart';
import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController passwordController = TextEditingController();

    // final responsive = ResponsiveBreakpoints.of(context);
    // final isMobile = responsive.isMobile;
    // final isTablet = responsive.isTablet;
    // final isDesktop = responsive.isDesktop;



    return const Scaffold(
      body: LoginForm()
    );
  }    
}

// Widget _buildMobileLayout(BuildContext context){
//   return  Container();
// }

// Widget _buildDeskopLayout(BuildContext context){
//   return  Container();
// }

// Widget _buildTabletLayout(BuildContext context){
//   return  Container();
// }