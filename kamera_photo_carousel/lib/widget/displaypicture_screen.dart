import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kamera_photo_carousel/widget/filter_carousel.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: PhotoFilterCarousel(
        imageFile: File(imagePath),
      ),
    );
  }
}