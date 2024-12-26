import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/features/task_details/ui/widgets/task_details_appbar.dart';
import 'package:tasky/features/task_details/ui/widgets/task_image_and_description.dart';
import '../widgets/task_details_cards.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TaskDetailsAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TaskImageAndDescription(),
                verticalSpacing(15),
                const TaskDetailsCards(),
                verticalSpacing(10),
                Center(
                  child: SizedBox(
                    height: 300,
                    child: PrettyQrView.data(
                      data: 'www.linkedin.com/in/mo7amed-shalaby',
                      decoration: const PrettyQrDecoration(),
                    ),
                  ),
                ),
                verticalSpacing(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
