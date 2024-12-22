import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/home/ui/widgets/home_app_bar.dart';
import 'package:tasky/features/home/ui/widgets/task_status_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: FloatingActionButton(
              elevation: 0.5,
              heroTag: 'tag1',
              backgroundColor: ColorsManager.lightPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {},
              child: Image.asset(
                'assets/images/barcode_icon.png',
                width: 20,
              ),
            ),
          ),
          verticalSpacing(10),
          FloatingActionButton(
            heroTag: 'tag2',
            backgroundColor: ColorsManager.mainPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {
              context.pushNamed(Routes.newTaskScreen);
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'My Tasks',
                  style: TextStyles.font16GreyBold,
                ),
              ),
              verticalSpacing(15),
              const TaskStatusList(),
              verticalSpacing(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/task_image.png',
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                    horizontalSpacing(5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              'Grocery Shopping App',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font16MainBlackBold,
                            ),
                          ),
                          verticalSpacing(5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Text(
                              'This application is designed for super shops. By using',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font14GreyRegular,
                            ),
                          ),
                          verticalSpacing(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/purple_flag.png',
                                    width: 18,
                                  ),
                                  horizontalSpacing(3),
                                  Text(
                                    'Medium',
                                    style: TextStyles.font12MainPurpleMedium,
                                  ),
                                ],
                              ),
                              Text(
                                '30/12/2022',
                                style: TextStyles.font12GreyRegular,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
