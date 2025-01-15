import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/theming/colors.dart';
import '../../../logic/edit_cubit/edit_task_cubit.dart';
import '../add_task/add_image_button.dart';

class EditImageWidget extends StatefulWidget {
  const EditImageWidget({super.key});

  @override
  State<EditImageWidget> createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
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
            context.watch<EditTaskCubit>().selectedImage != null
                ? Image.file(
                    context.watch<EditTaskCubit>().selectedImage!,
                    fit: BoxFit.contain,
                  )
                : CachedNetworkImage(
                    imageUrl:
                        'https://todo.iraqsapp.com/images/${context.read<EditTaskCubit>().imageUrl}',
                    fit: BoxFit.contain,
                  ),
            PositionedDirectional(
              bottom: -10,
              end: -10,
              child: GestureDetector(
                onTap: () {
                  showImagepickerSheet(
                    context: context,
                    onPickFromCamera: () {
                      context
                          .read<EditTaskCubit>()
                          .pickImage(ImageSource.camera);
                    },
                    onPickFromGallery: () {
                      context
                          .read<EditTaskCubit>()
                          .pickImage(ImageSource.gallery);
                    },
                  );
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
}
