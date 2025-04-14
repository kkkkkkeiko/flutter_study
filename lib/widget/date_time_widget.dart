import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/constants/app_style.dart';
import 'package:flutter_study/provider/radio_provider.dart';
import 'package:gap/gap.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key,
    required this.dateText,
    required this.valueText,
    required this.iconSection,
    required this.onTap,
  });

  final String dateText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateText, style: AppStyle.headingOne),
          const Gap(6),
          Material(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onTap(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [Icon(iconSection), Gap(6), Text(valueText)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
