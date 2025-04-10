import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../widget/date_time_widget.dart';
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
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: RadioWidget(
                    categColor: Colors.green,
                    titleRadio: 'LRN',
                  ),
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
          ),
          const Gap(12),
          // Date and Time Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                dateText: 'Date',
                valueText: 'dd/mm/yy',
                iconSection: CupertinoIcons.calendar,
              ),
              Gap(22),
              DateTimeWidget(
                dateText: 'Time',
                valueText: 'hh : mm',
                iconSection: CupertinoIcons.clock,
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
                  onPressed: () {},
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
                  onPressed: () {},
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
