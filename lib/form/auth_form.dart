import 'package:e_commerce_app/bloc/auth/auth_event.dart';
import 'package:e_commerce_app/bloc/auth/auth_state.dart';
import 'package:e_commerce_app/repositories/auth_repository/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/config/routes/router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin responsive để xử lý layout
    final responsive = ResponsiveBreakpoints.of(context);

    // Kiểm tra các loại thiết bị
    final isMobile = responsive.isMobile;
    final isTablet = responsive.isTablet;
    final isDesktop = responsive.isDesktop;

    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Nếu đăng nhập thành công, chuyển hướng đến trang Home
            context.router.push(const HomeRoute());
          } else if (state is AuthFailure) {
            // Nếu đăng nhập thất bại, hiển thị thông báo lỗi
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Lỗi: ${state.message}')),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Kiểm tra nếu là desktop hoặc tablet, thì dùng layout rộng hơn
                if (isDesktop || isTablet)
                  _buildDesktopTabletLayout()
                else
                  _buildMobileLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Layout cho desktop và tablet
  Widget _buildDesktopTabletLayout() {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Nhập email của bạn',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Mật khẩu',
            hintText: 'Nhập mật khẩu của bạn',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return CircularProgressIndicator(); // Hiển thị loader khi đang đăng nhập
            }
            return ElevatedButton(
              onPressed: () {
                // Gửi sự kiện đăng nhập
                context.read<AuthBloc>().add(
                  LoginEvent(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              },
              child: Text('Đăng nhập'),
            );
          },
        ),
      ],
    );
  }

  // Layout cho mobile
  Widget _buildMobileLayout() {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Nhập email của bạn',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Mật khẩu',
            hintText: 'Nhập mật khẩu của bạn',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return CircularProgressIndicator(); // Hiển thị loader khi đang đăng nhập
            }
            return ElevatedButton(
              onPressed: () {
                // Gửi sự kiện đăng nhập
                context.read<AuthBloc>().add(
                  LoginEvent(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              },
              child: const Text('Đăng nhập 222'),
            );
          },
        ),
      ],
    );
  }
}
