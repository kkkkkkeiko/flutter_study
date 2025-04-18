import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/model/radio_type.dart';
import 'package:flutter_study/model/todo_model.dart';
import 'package:flutter_study/provider/date_time_provider.dart';
import 'package:flutter_study/provider/radio_provider.dart';
import 'package:flutter_study/provider/service_provider.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../constants/app_style.dart';
import '../widget/date_time_widget.dart';
import '../widget/radio_widget.dart';
import '../widget/textfield_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  AddNewTaskModel({super.key})
    : titleController = TextEditingController(),
      descriptionController = TextEditingController();
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('AddNewTaskModel');

    final radioCategory = ref.watch(radioProvider);
    final dateProv = ref.watch(dateProvider);

    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'New Task Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(thickness: 1.2, color: Colors.grey.shade200),
          const Gap(12),
          const Text('Title Task', style: AppStyle.headingOne),
          const Gap(6),
          TextFieldWidget(
            maxLine: 1,
            hintText: 'Add Task name.',
            txtController: titleController,
          ),
          const Gap(12),
          const Text('Description', style: AppStyle.headingOne),
          const Gap(6),
          TextFieldWidget(
            maxLine: 3,
            hintText: 'Add Descriptions',
            txtController: descriptionController,
          ),
          const Gap(12),
          const Text('Category', style: AppStyle.headingOne),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                for (final radioType in RadioType.values)
                  Expanded(
                    child: RadioWidget(
                      categColor: radioType.getColor(),
                      titleRadio: radioType.label,
                      valueInput: radioType,
                      onChangeValue:
                          () => ref
                              .read(radioProvider.notifier)
                              .update((state) => radioType),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(12),
          // Date and Time Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                dateText: 'Date',
                valueText: dateProv,
                iconSection: CupertinoIcons.calendar,
                onTap: () async {
                  print('start');
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2030),
                  );
                  print(getValue);
                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                  print('end');
                },
              ),
              Gap(22),
              DateTimeWidget(
                dateText: 'Time',
                valueText: ref.watch(timeProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
              ),
            ],
          ),
          //Button Sections
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade700,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue.shade700),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue.shade700),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    final getRadioValue = ref.read(radioProvider);

                    ref
                        .read(serviceProvider)
                        .addNewTask(
                          TodoModel(
                            titleTask: titleController.text,
                            description: descriptionController.text,
                            category: getRadioValue,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                            isDone: false,
                          ),
                        );
                    print('Data is saving');

                    titleController.clear();
                    descriptionController.clear();
                    ref
                        .read(radioProvider.notifier)
                        .update((state) => RadioType.learn);
                    ref.read(dateProvider.notifier).update((state) => '');
                    ref.read(timeProvider.notifier).update((state) => '');
                    print('Data is clear');
                    // Close the modal
                    Navigator.pop(context);
                  },
                  child: Text('Create'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
