// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:misha/core/helpers/app_regexp.dart';
import 'package:misha/core/helpers/spacing.dart';
import 'package:misha/features/home/ui/widgets/home_button.dart';
import 'package:misha/features/home/ui/widgets/picked_image.dart';
import 'package:tflite_v2/tflite_v2.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  var _recognitions;
  var v = "";
  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/models/model_unquant.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      log('Error picking image from Gallery: $e');
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      log('Error picking image from Camera: $e');
    }
  }

  Future detectimage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      v = recognitions.toString();
    });
    log(_recognitions.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PickedImage(
          image: _image,
        ),
        verticalSpace(50),
        HomeButton(
          text: 'Pick Image from Gallery',
          onPressed: _pickImageFromGallery,
          icon: Icons.photo_library_outlined,
        ),
        verticalSpace(15),
        HomeButton(
          text: 'Pick Image via Camera  ',
          onPressed: _pickImageFromCamera,
          icon: Icons.camera_alt_outlined,
        ),
        verticalSpace(20),
        Text(
          v.isEmpty ? '' : AppRegexp.getAnimalNameFromResult(v).toUpperCase(),
          style: TextStyle(
            color: Colors.green,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: Colors.green,
            decorationThickness: 2.sp,
          ),
        ),
      ],
    ));
  }
}
