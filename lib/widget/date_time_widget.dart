import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/constants/app_style.dart';
import 'package:gap/gap.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.dateText,
    required this.valueText,
    required this.iconSection,
  });

  final String dateText;
  final String valueText;
  final IconData iconSection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateText, style: AppStyle.headingOne),
          const Gap(6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(children: [Icon(iconSection), Gap(12), Text(valueText)]),
          ),
        ],
      ),
    );
  }
}
