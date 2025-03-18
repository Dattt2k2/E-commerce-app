import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";
import "package:e_commerce_app/config/routes/router.dart";
import "package:e_commerce_app/styles/text_style.dart";
import "package:e_commerce_app/styles/custom_button.dart";
import "dart:math" as math;


enum AuthCardSide {
  login,
  register,
  forgotPassword
}

class FlipAuthCard extends StatefulWidget {
  const FlipAuthCard({super.key});

  @override
  State<FlipAuthCard> createState() => _FlipAuthCardState();
}

class _FlipAuthCardState extends State<FlipAuthCard> with SingleTickerProviderStateMixin{
  
  AuthCardSide currenSide = AuthCardSide.login;
  late AnimationController _animationController;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  bool _isAnimating = false;
  
  @override

  void initState(){
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );

    _frontRotation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: math.pi / 2)
        .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50.0
      ),
    ]).animate(_animationController);

    _backRotation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: math.pi, end: math.pi / 2)
        .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50.0
      ),
    ]).animate(_animationController);
  }
  
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  void _switchCard(AuthCardSide newSide) {
    if (currenSide == newSide || _isAnimating) return;

    setState(() {
      _isAnimating = true;
    });

    _animationController.forward().then((_) {
      setState(() {
        currenSide = newSide;
      });

      _animationController.reverse().then((_) {
        setState(() {
          _isAnimating = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child){
        return Stack(
          children: [
            _buildCardFace(
              rotation: _frontRotation.value,
              isVisible: _frontRotation.value < (math.pi / 2),
              child: _buildCardContent(currenSide),
            ),
            _buildCardFace(
              rotation: _backRotation.value,
              isVisible: _backRotation.value < (math.pi / 2),
              child: _buildCardContent(_getNextSide()),
            )
          ],
        );
      }
    );
  }

  AuthCardSide _getNextSide(){
    
    if (!_isAnimating) return currenSide;

    switch (currenSide) {
      case AuthCardSide.login:
        return AuthCardSide.register;
      case AuthCardSide.register:
        return AuthCardSide.login;
      case AuthCardSide.forgotPassword:
        return AuthCardSide.login;
      default:
        return AuthCardSide.login;
    }
  }

  Widget _buildCardFace({
    required double rotation,
    required bool isVisible,
    required Widget child,
  }) {
    return Visibility(
      visible: isVisible,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotation),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: child,
            )
          )
      )
    );
  }

  Widget _buildCardContent(AuthCardSide side){
    switch (side){
      case AuthCardSide.login:
        return _buildLoginContent();
      case AuthCardSide.register:
        return _buildRegisterContent();
      case AuthCardSide.forgotPassword:
        return _buildForgotPasswordContent();
    }
  }

  Widget _buildLoginContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome Back',
            style: CustomTextStyle.headlineMedium(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _switchCard(AuthCardSide.forgotPassword),
              child: const Text('Forgot password?'),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Login',
            onpressed: () => context.router.push(const HomeRoute()),
            backgroundColor: Colors.blue,
            textColor: Colors.white,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () => _switchCard(AuthCardSide.register),
                child: const Text('Sign up'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Create Account',
            style: CustomTextStyle.headlineMedium(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Sign Up',
            onpressed: () => context.router.push(const HomeRoute()),
            backgroundColor: Colors.blue,
            textColor: Colors.white,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () => _switchCard(AuthCardSide.login),
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Reset Password',
            style: CustomTextStyle.headlineMedium(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Enter your email and we will send you instructions to reset your password',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Send Reset Link',
            onpressed: () {},
            backgroundColor: Colors.blue,
            textColor: Colors.white,
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () => _switchCard(AuthCardSide.login),
              child: const Text('Back to Login'),
            ),
          ),
        ],
      ),
    );
  }
}

