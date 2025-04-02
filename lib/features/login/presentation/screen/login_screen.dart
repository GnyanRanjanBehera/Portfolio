import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/login/presentation/widget/google_login.dart';
import 'package:portfolio/features/login/presentation/widget/login_form.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScaleTransition(
          scale: scale,
          child: Column(
            children: [
              LoginForm(),
              GoogleLogin(),
            ],
          ),
        ),
      ),
    );
  }

  void _initializeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    scale = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
