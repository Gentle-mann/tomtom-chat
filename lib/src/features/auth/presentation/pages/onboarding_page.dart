import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tomtom/src/features/auth/presentation/pages/signup_page.dart';

import 'login_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1E1E1E),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(right: 0, child: Image.asset('assets/images/ellipse.png')),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/logo.svg'),
                              SizedBox(width: 5.h),
                              Text(
                                'Chatbox',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Text.rich(
                          TextSpan(
                            text: 'Connect ',
                            style: TextStyle(
                                fontSize: 68.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            children: const [
                              TextSpan(
                                text: 'friends ',
                              ),
                              TextSpan(
                                text: 'easily & ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'quickly',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          style: const TextStyle(height: 1.2),
                        ),
                        SizedBox(height: 10.h),
                        Text.rich(
                          const TextSpan(
                            text: 'Our chat app is the perfect way to stay ',
                            children: [
                              TextSpan(
                                text: 'connected with friends and family.',
                              ),
                            ],
                          ),
                          style: TextStyle(
                            color: const Color(0XFFB9C1BE),
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SocialAccountCard(
                              iconPath: 'assets/icons/facebook.svg',
                              isBorderWhite: true,
                            ),
                            SizedBox(width: 20.h),
                            const SocialAccountCard(
                              iconPath: 'assets/icons/google.svg',
                              isBorderWhite: true,
                            ),
                            SizedBox(width: 20.h),
                            const SocialAccountCard(
                              iconPath: 'assets/icons/apple.svg',
                              isAppleWhite: true,
                              isBorderWhite: true,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        const ORDivider(isDarkBackground: true),
                        SizedBox(height: 30.h),
                        DefaultButton(
                          onTap: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          title: 'Sign up with mail',
                          isDarkBackground: true,
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Existing account? ',
                              style: TextStyle(color: Color(0XFFB9C1BE)),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
