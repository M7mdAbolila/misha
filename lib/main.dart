import 'package:flutter/material.dart';
import 'package:misha/core/helpers/constants.dart';
import 'package:misha/core/helpers/shared_pref_helper.dart';
import 'package:misha/core/routing/app_router.dart';
import 'package:misha/misha_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfIsfirstTime();
  runApp(
    MishaApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfIsfirstTime() async {
  bool isLoggedIInUser =
      await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIInUser) ?? false;
  if (isLoggedIInUser) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
