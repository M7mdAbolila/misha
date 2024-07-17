import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
          horizontalSpace(10),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
