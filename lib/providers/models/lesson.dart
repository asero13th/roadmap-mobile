import 'dart:ffi';

class Lesson {
  final String title;
  final String content;
  final int duration;
  final String videoLink;
  final int lessonNumber;
  final String detailExplanation;

  Lesson({
    required this.title,
    required this.content,
    required this.duration,
    required this.videoLink,
    required this.lessonNumber,
    required this.detailExplanation,
  });

  @override
  String toString() {
    return 'Lesson{title: $title, content: $content, duration: $duration, videoLink: $videoLink, lessonNumber: $lessonNumber, detailExplanation: $detailExplanation}';
  }

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      duration: json['duration'] ?? 0,
      videoLink: json['videoLink'] ?? '',
      lessonNumber: json['lessonNumber'] ?? 2,
      detailExplanation: json['detail_explanation'] ?? '',
    );
  }
}
