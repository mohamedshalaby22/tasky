import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/constants/app_images.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/new_task/logic/add_cubit/new_task_cubit.dart';
import 'package:tasky/features/task_details/ui/widgets/task_details_cards.dart';

class AddImageButton extends StatefulWidget {
  const AddImageButton({super.key});

  @override
  State<AddImageButton> createState() => _AddImageButtonState();
}

class _AddImageButtonState extends State<AddImageButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (context.watch<NewTaskCubit>().selectedImage != null)
          _buildSelectedImagePreview()
        else
          _buildAddImageButton(),
      ],
    );
  }

  Center _buildSelectedImagePreview() {
    final taskCubit = context.read<NewTaskCubit>();
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
            Image.file(
              taskCubit.selectedImage!,
              fit: BoxFit.contain,
            ),
            PositionedDirectional(
                bottom: -10,
                end: -10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      taskCubit.selectedImage = null;
                    });
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorsManager.lightRed,
                    child: Icon(
                      Icons.delete_forever,
                      color: ColorsManager.red,
                      size: 28,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildAddImageButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showImagepickerSheet(
          context: context,
          onPickFromCamera: () {
            context.read<NewTaskCubit>().pickImage(ImageSource.camera);
          },
          onPickFromGallery: () {
            context.read<NewTaskCubit>().pickImage(ImageSource.gallery);
          },
        );
      },
      child: DottedBorder(
        strokeWidth: 1,
        borderType: BorderType.RRect,
        dashPattern: const [3, 3],
        color: ColorsManager.mainPurple,
        radius: const Radius.circular(10),
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesAddImage,
                  width: 25,
                ),
                horizontalSpacing(10),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    'Add Img',
                    style: TextStyles.font19MainPurpleMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showImagepickerSheet(
    {required BuildContext context,
    required Function onPickFromCamera,
    required Function onPickFromGallery}) {
  return showModalBottomSheet(
      elevation: 0.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      context: context,
      builder: (_) {
        return Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: ColorsManager.lighterPurple,
                    child: Icon(
                      Icons.close,
                      color: ColorsManager.mainPurple,
                    ),
                  ),
                ),
              ),
              verticalSpacing(15),
              GestureDetector(
                onTap: () {
                  onPickFromGallery();
                  context.pop();
                },
                child: buildInfoCard(
                    child: Row(
                  children: [
                    const Icon(Icons.image_outlined,
                        color: ColorsManager.mainPurple),
                    horizontalSpacing(10),
                    Text(
                      'Choose Image From Gallery',
                      style: TextStyles.font16MainPurpleBold,
                    ),
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  onPickFromCamera();
                  context.pop();
                },
                child: buildInfoCard(
                    child: Row(
                  children: [
                    const Icon(Icons.camera_outlined,
                        color: ColorsManager.mainPurple),
                    horizontalSpacing(10),
                    Text(
                      'Pick Image From Camera',
                      style: TextStyles.font16MainPurpleBold,
                    ),
                  ],
                )),
              ),
            ],
          ),
        );
      });
}
