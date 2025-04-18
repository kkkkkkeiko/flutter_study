import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_study/model/radio_type.dart';

class TodoModel {
  String? docID;
  final String titleTask;
  final String description;
  final RadioType category;
  final String dateTask;
  final String timeTask;
  final bool isDone;
  TodoModel({
    this.docID,
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'docID': docID,
      'titleTask': titleTask,
      'description': description,
      'category': category.value,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docID: map['docID'] != null ? map['docID'] as String : null,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      category: RadioType.getRadioType(map['category']),
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel(
      docID: doc.id,
      titleTask: doc['titleTask'],
      description: doc['description'],
      category: RadioType.getRadioType(doc['category']),
      dateTask: doc['dateTask'],
      timeTask: doc['timeTask'],
      isDone: doc['isDone'],
    );
  }
}
