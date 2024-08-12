import 'dart:convert';
import 'package:roadmap/providers/models/lesson.dart';

class Course {
  final int courseId;
  final String title;
  final String description;
  final String category;
  final String courseColor;
  final int review;
  final List<Lesson> lessons;

  Course({
    required this.courseId,
    required this.title,
    required this.description,
    required this.category,
    required this.courseColor,
    required this.review,
    required this.lessons,
  });

  @override
  String toString() {
    return 'Course{id: $courseId, title: $title, description: $description, category: $category, courseColor: $courseColor, review: $review, lessons: $lessons}';
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    var lessonsJson = json['lessons'];
    List<Lesson> lessonsList;

    if (lessonsJson is String) {
      lessonsList = (jsonDecode(lessonsJson) as List)
          .map((lessonJson) => Lesson.fromJson(lessonJson))
          .toList();
    } else if (lessonsJson is List) {
      lessonsList =
          lessonsJson.map((lessonJson) => Lesson.fromJson(lessonJson)).toList();
    } else {
      throw Exception('Invalid type for lessons');
    }

    return Course(
      courseId: json['course_id'] ?? 3,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      courseColor: json['course_color'] ?? '',
      review: json['review'] ?? 0,
      lessons: lessonsList,
    );
  }
}
