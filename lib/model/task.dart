// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class MyTasks extends Equatable {
  String title;
  bool? isDone;
  bool? isDeleted;
  String whenCreated;

  MyTasks({
    required this.title,
    this.isDone,
    this.isDeleted,
    required this.whenCreated,
  }) {
    isDeleted = isDeleted ?? false;
    isDone = isDone ?? false;
  }

  void changeDone() {
    isDone != isDone;
  }

  MyTasks copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
    String? whenCreated,
  }) {
    return MyTasks(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      whenCreated: whenCreated ?? this.whenCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'whenCreated': whenCreated,
    };
  }

  factory MyTasks.fromMap(Map<String, dynamic> map) {
    return MyTasks(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      whenCreated: map['whenCreated'] as String,
    );
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone, whenCreated];
}
