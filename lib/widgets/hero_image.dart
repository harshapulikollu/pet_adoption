import 'package:flutter/material.dart';

import '../pages/image_viewer.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({Key? key, required this.heroTag, required this.imageUrl})
      : super(key: key);
  final String heroTag;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/imageViewer',
              arguments: ImageViewerArguments(imagePath: imageUrl));
        },
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
