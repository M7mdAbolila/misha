import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misha/core/helpers/constants.dart';
import 'package:misha/core/routing/app_router.dart';
import 'package:misha/core/routing/routes.dart';

class MishaApp extends StatelessWidget {
  const MishaApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Misha',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute:
            isLoggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
      ),
    );
  }
}
