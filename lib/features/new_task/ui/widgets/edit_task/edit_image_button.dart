import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/theming/colors.dart';

class EditImageWidget extends StatefulWidget {
  const EditImageWidget({super.key});

  @override
  State<EditImageWidget> createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 320),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.lighterGrey, width: 1.1),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            selectedImage != null
                ? Image.file(
                    selectedImage!,
                    fit: BoxFit.contain,
                  )
                : Image.asset(Assets.imagesTaskImage),
            PositionedDirectional(
              bottom: -10,
              end: -10,
              child: GestureDetector(
                onTap: () {
                  pickImage(ImageSource.gallery);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorsManager.lightPurple,
                  child: Icon(
                    Icons.edit,
                    color: ColorsManager.mainPurple,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? xFile = await picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      if (xFile != null) {
        setState(() {
          selectedImage = File(xFile.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
}
