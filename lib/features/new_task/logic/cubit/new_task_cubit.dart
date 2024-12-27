import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/features/new_task/data/repos/new_task_repo.dart';
part 'new_task_state.dart';
part 'new_task_cubit.freezed.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  final NewTaskRepo _newTaskRepo;
  NewTaskCubit(this._newTaskRepo) : super(const NewTaskState.initial());

  void uploadImageAndAddData() async {
    emit(const NewTaskState.loading());
    final imageUploadResponse = await _newTaskRepo.uploadImage(selectedImage!);

    imageUploadResponse.when(
      success: (imageUploadResponse) async {
        String imageUrl = imageUploadResponse.image;
        print(imageUrl);
        emit(NewTaskState.success(imageUploadResponse));
      },
      failure: (message) {
        emit(NewTaskState.error(error: message.toString()));
      },
    );
  }
  // Future<void> uploadImage() async {
  //   try {
  //     // Replace with your actual token retrieval mechanism
  //     final token = await TokenStorage.getAccessToken();

  //     final dio = Dio();

  //     // Create FormData
  //     final formData = FormData.fromMap({
  //       'image': await MultipartFile.fromFile(
  //         selectedImage!.path,
  //         filename: selectedImage!.uri.pathSegments.last,
  //         contentType: DioMediaType('image', 'jpg'),
  //       ),
  //     });

  //     // Send Request
  //     final response = await dio.post(
  //       'https://todo.iraqsapp.com/upload/image',
  //       data: formData,
  //       options: Options(
  //         method: 'POST',
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //         validateStatus: (status) => true,
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       print("Response Data: ${json.encode(response.data)}");
  //     } else {
  //       print("Response Status: ${response.statusMessage}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
  // void addTask() async {
  //   emit(const NewTaskState.loading());
  //   final response = await _newTaskRepo.addNewTask(
  //     AddNewTaskRequestBody(
  //       title: 'title',
  //       des: 'description',
  //       image: '',
  //       priority: '',
  //       dueDate: '',
  //     ),
  //   );
  //   response.when(
  //     success: (addTaskResponse) {
  //       emit(NewTaskState.success(addTaskResponse));
  //     },
  //     failure: (message) {
  //       emit(NewTaskState.error(error: message.toString()));
  //     },
  //   );
  // }

  File? selectedImage;
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
        selectedImage = File(xFile.path);
        emit(NewTaskState.imageSelected(image: selectedImage!));
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
}
