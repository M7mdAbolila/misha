import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misha/core/helpers/constants.dart';
import 'package:misha/core/helpers/extensions.dart';
import 'package:misha/core/helpers/spacing.dart';
import 'package:misha/core/routing/routes.dart';

import '../../../core/helpers/shared_pref_helper.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'assets/cat.png',
                    height: 220.h,
                  ),
                  Image.asset(
                    'assets/scanner.png',
                    height: 260.h,
                    color: Colors.blue,
                  ),
                ],
              ),
              verticalSpace(100),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
                  SharedPrefHelper.setData(
                      SharedPrefKeys.isLoggedIInUser, true);
                  context.pushReplacementNamed(Routes.homeScreen);
                },
                child: SizedBox(
                  width: 250.w,
                  child: Center(
                    child: Text(
                      'LET\'S GO',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
