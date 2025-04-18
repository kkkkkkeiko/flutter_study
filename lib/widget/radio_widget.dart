import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/model/radio_type.dart';
import 'package:flutter_study/provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.categColor,
    required this.titleRadio,
    required this.valueInput,
    required this.onChangeValue,
  });

  final String titleRadio;
  final Color categColor;
  final RadioType valueInput;
  final VoidCallback onChangeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return RadioListTile(
      activeColor: categColor,
      contentPadding: EdgeInsets.zero,
      fillColor: WidgetStateProperty.all(categColor),
      title: Transform.translate(
        offset: Offset(-22, 0),
        child: Text(
          titleRadio,
          style: TextStyle(color: categColor, fontWeight: FontWeight.w700),
        ),
      ),
      value: valueInput,
      groupValue: radio,
      onChanged: (value) => onChangeValue(),
    );
  }
}
