import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomtom/src/features/chat/presentation/pages/chat_page.dart';
import 'package:tomtom/src/core/constants/colors.dart';
import 'package:tomtom/src/features/auth/presentation/pages/login_page.dart';
import 'package:tomtom/src/features/auth/presentation/pages/onboarding_page.dart';
import 'package:tomtom/src/features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(const TomTom());
}

class TomTom extends StatelessWidget {
  const TomTom({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'TomTom',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreen),
          fontFamily: 'Carlos',
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const OnboardingScreen());
            case '/login':
              return MaterialPageRoute(
                  builder: (context) => const LoginScreen());
            case '/signup':
              return MaterialPageRoute(
                  builder: (context) => const SignupScreen());
            case '/chat':
              return MaterialPageRoute(builder: (context) => const ChatPage());
            default:
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(child: Text('No route found')),
                ),
              );
          }
        },
        initialRoute: '/',
      ),
    );
  }
}
