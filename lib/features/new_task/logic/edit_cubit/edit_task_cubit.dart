import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/models/edit_task/edit_task_body.dart';
import '../../data/repos/new_task_repo.dart';
part 'edit_task_state.dart';
part 'edit_task_cubit.freezed.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final NewTaskRepo _newTaskRepo;
  final String taskId, title, desc, priority, status, image;
  EditTaskCubit(this._newTaskRepo, this.taskId, this.title, this.desc,
      this.priority, this.status, this.image)
      : super(const EditTaskState.initial()) {
    titleController = TextEditingController(text: title);
    descriptionController = TextEditingController(text: desc);
    selectedPriority = priority;
    selectedStatus = status;
    imageUrl = image;
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String selectedPriority = '';
  String selectedStatus = '';
  String imageUrl = '';

  void uploadImageAndUpdateTask() async {
    emit(const EditTaskState.loading());
    if (selectedImage == null) {
      await _updateTaskData();
      return;
    }
    final imageUploadResponse = await _newTaskRepo.uploadImage(selectedImage!);
    imageUploadResponse.when(
      success: (imageUploadResponse) async {
        imageUrl = imageUploadResponse.image;
        await _updateTaskData();
      },
      failure: (message) {
        emit(EditTaskState.error(error: message.toString()));
      },
    );
  }

  Future<void> _updateTaskData() async {
    final requestBody = EditTaskRequestBody(
      title: titleController.text,
      desc: descriptionController.text,
      image: imageUrl,
      priority: selectedPriority,
      status: selectedStatus,
    );
    try {
      final addTaskResponse = await _newTaskRepo.editTask(requestBody, taskId);
      addTaskResponse.when(
        success: (response) {
          emit(EditTaskState.success(response));
        },
        failure: (error) {
          emit(EditTaskState.error(error: error.toString()));
        },
      );
    } catch (e) {
      emit(EditTaskState.error(error: 'Failed to Edit task: $e'));
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
        emit(EditTaskState.imageSelected(image: selectedImage!));
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
}
