import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/features/new_task/data/repos/new_task_repo.dart';
import '../../data/models/add_task/new_task_request_body.dart';
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
        await _addNewTask(imageUrl);
      },
      failure: (message) {
        emit(NewTaskState.error(error: message.toString()));
      },
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String selectedPriority = 'medium';
  String selectedDate = '';
  Future<void> _addNewTask(String imageUrl) async {
    final requestBody = AddNewTaskRequestBody(
      title: titleController.text,
      desc: descriptionController.text,
      image: imageUrl,
      priority: selectedPriority,
      dueDate: selectedDate,
    );

    try {
      final addTaskResponse = await _newTaskRepo.addNewTask(requestBody);
      addTaskResponse.when(
        success: (response) {
          emit(NewTaskState.success(response));
        },
        failure: (error) {
          emit(NewTaskState.error(error: error.toString()));
        },
      );
    } catch (e) {
      emit(NewTaskState.error(error: 'Failed to add task: $e'));
    }
  }

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
