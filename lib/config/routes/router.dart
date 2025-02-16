import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/screen/app_screen/home_page.dart';
import 'package:e_commerce_app/screen/auth/forgot_pass.dart';
import 'package:e_commerce_app/screen/auth/log_in.dart';
import 'package:e_commerce_app/screen/auth/register.dart';
import 'package:e_commerce_app/screen/auth/splash_screen.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter() : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,  // Đảm bảo sử dụng đúng page
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: RegisterRoute.page,  // Đảm bảo sử dụng đúng page
          path: '/register',
        ),
        AutoRoute(
          page: LoginRoute.page,  // Đảm bảo sử dụng đúng page
          path: '/login',
        ),
        AutoRoute(
          page: ForgotPassRoute.page,  // Đảm bảo sử dụng đúng page
          path: '/forgotpass',
        ),
        AutoRoute(
          page: HomeRoute.page,  // Đảm bảo sử dụng đúng page
          path: '/homepage',
        ),
      ];
}
