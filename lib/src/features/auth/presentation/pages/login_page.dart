import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tomtom/src/features/auth/presentation/views/custom_form_field.dart';
import 'package:tomtom/src/features/auth/presentation/pages/signup_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: DefaultPadding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            bottom: 2,
                            child: Container(
                              color: const Color(0XFF41B2A4),
                              height: 8.h,
                              width: 60.w,
                            ),
                          ),
                          Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        ' to Chatbox',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                const AuthSubtitleText(
                  title: 'Welcome back! Sign in using your social\n',
                  subtitle: ' account or email to continue with us',
                ),
                SizedBox(height: 30.h),
                const SocialAccountRow(),
                SizedBox(height: 25.h),
                const ORDivider(),
                SizedBox(height: 25.h),
                const CustomFormField(title: 'Your email'),
                const CustomFormField(title: 'Password'),
                SizedBox(height: 130.h),
                Center(
                  child: DefaultButton(
                    title: 'Log in',
                    onTap: () {
                      Navigator.of(context).pushNamed('/chat');
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ORDivider extends StatelessWidget {
  const ORDivider({
    super.key,
    this.isDarkBackground = false,
  });
  final bool isDarkBackground;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDarkBackground
                ? const Color(0XFFCDD1D0)
                : const Color(0XFFCDD1D0),
          ),
        ),
        SizedBox(width: 15.h),
        Text(
          'OR',
          style: TextStyle(
              color: !isDarkBackground
                  ? const Color(0XFF797C7B)
                  : const Color(0XFFD6E4E0)),
        ),
        SizedBox(width: 15.h),
        const Expanded(
          child: Divider(
            color: Color(0XFFCDD1D0),
          ),
        ),
      ],
    );
  }
}

class SocialAccountRow extends StatelessWidget {
  const SocialAccountRow({
    super.key,
    this.isAppleWhite = false,
  });
  final bool isAppleWhite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SocialAccountCard(
          iconPath: 'assets/icons/facebook.svg',
        ),
        SizedBox(width: 20.h),
        const SocialAccountCard(
          iconPath: 'assets/icons/google.svg',
        ),
        SizedBox(width: 20.h),
        const SocialAccountCard(
          iconPath: 'assets/icons/apple.svg',
        ),
      ],
    );
  }
}

class SocialAccountCard extends StatelessWidget {
  const SocialAccountCard({
    super.key,
    required this.iconPath,
    this.isAppleWhite = false,
    this.isBorderWhite = false,
  });
  final String iconPath;
  final bool isAppleWhite;
  final bool isBorderWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.5,
          color: isBorderWhite ? Colors.white : Colors.black,
        ),
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: isAppleWhite
            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
