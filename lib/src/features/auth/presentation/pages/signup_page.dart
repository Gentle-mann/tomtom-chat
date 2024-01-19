import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tomtom/src/features/auth/presentation/views/custom_form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.w,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: SvgPicture.asset('assets/icons/back.svg'),
        ),
      ),
      body: SafeArea(
        child: DefaultPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthTitleText(),
                SizedBox(height: 10.h),
                const AuthSubtitleText(
                  title: 'Get Chatting with friends and family today by\n',
                  subtitle: 'signing up for our chat app!',
                ),
                SizedBox(height: 40.h),
                const CustomFormField(title: 'Your name'),
                const CustomFormField(title: 'Your email'),
                const CustomFormField(title: 'Password'),
                const CustomFormField(title: 'Confirm Password'),
                //SignUpForm(),
                SizedBox(height: 100.sp),
                Center(
                  child: DefaultButton(
                    title: 'Create an account',
                    onTap: () {},
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

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.isDarkBackground = false,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String title;
  final bool isDarkBackground;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.87,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFFF3F6F6),
          // isDarkBackground ? Colors.white : AppColors.darkGreen,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0XFF797C7B),
            //color: isDarkBackground ? Colors.black : Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class AuthSubtitleText extends StatelessWidget {
  const AuthSubtitleText({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: title,
          children: [
            TextSpan(text: subtitle),
          ],
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0XFF797C7B),
        ),
      ),
    );
  }
}

class AuthTitleText extends StatelessWidget {
  const AuthTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign up with ',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
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
                'Email',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DefaultPadding extends StatelessWidget {
  const DefaultPadding({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: 15.w, left: 15.w, top: 50.h, bottom: 20.h),
      child: child,
    );
  }
}
