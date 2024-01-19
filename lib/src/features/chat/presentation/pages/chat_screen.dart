import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tomtom/src/features/auth/presentation/pages/signup_page.dart';

import '../../../../core/constants/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                'assets/icons/back.svg',
                width: 16.h,
              ),
            ),
            SizedBox(width: 10.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/profile_image.png'),
                  radius: 22.h,
                ),
                Positioned(
                  right: 3,
                  bottom: 5,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.green,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jhon Abraam',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0XFF000E08),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Active now',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0XFF797C7B),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/telephone.svg',
                height: 18.h,
              ),
              SizedBox(width: 15.w),
              SvgPicture.asset(
                'assets/icons/video.svg',
                height: 24.h,
              ),
              SizedBox(width: 15.h)
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.h),
                  decoration: BoxDecoration(
                    color: const Color(0XFFF8FBFA),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: const Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.h),
                        bottomLeft: Radius.circular(13.h),
                        bottomRight: Radius.circular(13.h),
                      ),
                    ),
                    child: const Text(
                      'Hello! Jhon abraham',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '09:25 AM',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0XFF797C7B),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 20.h,
                        backgroundImage: const AssetImage(
                          'assets/images/profile_image.png',
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jhon Abraham',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFFF2F7FB),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13.h),
                            bottomLeft: Radius.circular(13.h),
                            bottomRight: Radius.circular(13.h),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        child: const Text(
                          'Hello ! Nazrul How are you?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '09:25 AM',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0XFF797C7B),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
