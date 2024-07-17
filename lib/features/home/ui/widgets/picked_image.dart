import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/spacing.dart';

class PickedImage extends StatelessWidget {
  const PickedImage({super.key, this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Image.file(
            File(image!.path),
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          )
        : Column(
            children: [
              Image.asset(
                'assets/scanner.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                color: Colors.blue,
              ),
              verticalSpace(20),
              const Text('Pick an image!'),
            ],
          );
  }
}
