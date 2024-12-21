import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final String imagePath;
  final bool isMaxHeight;
  const ResponsiveImage(
      {super.key, required this.imagePath, this.isMaxHeight = true});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: isMaxHeight ? constraints.maxWidth : constraints.maxWidth / 2,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
