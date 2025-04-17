import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/model/radio_type.dart';

final radioProvider = StateProvider<RadioType>((ref) {
  return RadioType.learn;
});
