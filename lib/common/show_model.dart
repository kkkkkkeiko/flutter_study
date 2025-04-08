import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../widget/radio_widget.dart';
import '../widget/textfield_widget.dart';

class AddNewTaskModel extends StatelessWidget {
  const AddNewTaskModel({super.key});

  @override
  Widget build(BuildContext context) {
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
          const TextFieldWidget(maxLine: 1, hintText: 'Add Task name.'),
          const Gap(12),
          const Text('Description', style: AppStyle.headingOne),
          const Gap(6),
          const TextFieldWidget(maxLine: 3, hintText: 'Add Descriptions'),
          const Gap(12),
          const Text('Category', style: AppStyle.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidget(categColor: Colors.green, titleRadio: 'LRN'),
              ),
              Expanded(
                child: RadioWidget(
                  categColor: Colors.blue.shade700,
                  titleRadio: 'WRK',
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categColor: Colors.amberAccent.shade700,
                  titleRadio: 'GEN',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
