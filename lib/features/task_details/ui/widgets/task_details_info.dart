import 'package:flutter/widgets.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/features/task_details/data/models/task_details_response.dart';
import 'package:tasky/features/task_details/ui/widgets/task_details_cards.dart';
import 'package:tasky/features/task_details/ui/widgets/task_image_and_description.dart';

class TaskDetailsInfo extends StatelessWidget {
  const TaskDetailsInfo({super.key, required this.taskDetailsResponse});
final TaskDetailsResponse taskDetailsResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         TaskImageAndDescription(
          title: taskDetailsResponse.title,
          description: taskDetailsResponse.desc,
        ),
        verticalSpacing(15),
         TaskDetailsCards(
          status: taskDetailsResponse.status,
          date: '30 June,2022',
          priority: taskDetailsResponse.priority,
        ),
        verticalSpacing(10),
        Center(
          child: SizedBox(
            height: 300,
            child: PrettyQrView.data(
              data: taskDetailsResponse.id,
              decoration: const PrettyQrDecoration(),
            ),
          ),
        ),
        verticalSpacing(20),
      ],
    );
  }
}
