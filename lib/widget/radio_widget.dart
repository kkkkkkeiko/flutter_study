import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    super.key,
    required this.categColor,
    required this.titleRadio,
  });

  final String titleRadio;
  final Color categColor;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      fillColor: WidgetStateProperty.all(categColor),
      title: Transform.translate(
        offset: Offset(-22, 0),
        child: Text(
          titleRadio,
          style: TextStyle(color: categColor, fontWeight: FontWeight.w700),
        ),
      ),
      value: 1,
      groupValue: 0,
      onChanged: (value) {},
    );
  }
}
