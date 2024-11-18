import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/screen/app_screen/home_page.dart';
import 'package:e_commerce_app/screen/auth/forgot_pass.dart';
import 'package:e_commerce_app/screen/auth/log_in.dart';
import 'package:e_commerce_app/screen/auth/register.dart';
import 'package:e_commerce_app/screen/auth/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter  {
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: '/register',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: ForgotPassRoute.page,
          path: '/forgotpass',
        ),
        AutoRoute(
          page: HomeRouteRoute.page,
          path: '/homepage',
        )
      ];

  config() {}
}