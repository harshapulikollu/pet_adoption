import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// Page to display Pet image with zoom in and out interaction
class ImageViewer extends StatelessWidget {
  const ImageViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ImageViewerArguments;
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: args.heroTag,
            child: PhotoView(
              imageProvider: AssetImage(args.imagePath),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.close),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageViewerArguments {
  final String imagePath;
  final String heroTag;
  ImageViewerArguments({required this.imagePath, required this.heroTag});
}
