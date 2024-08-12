import 'package:flutter/material.dart';
import 'package:roadmap/screens/lesson.dart';
import 'package:roadmap/providers/models/lesson.dart';

class CourseDescriptionCard extends StatefulWidget {
  final Lesson lesson;
  final int id;
  final String topic;
  const CourseDescriptionCard({super.key, required this.lesson, required this.id, required this.topic});

  @override
  State<CourseDescriptionCard> createState() => _CourseDescriptionCardState();
}

class _CourseDescriptionCardState extends State<CourseDescriptionCard> {
  void redirectToLessonDetailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LessonDetailScreen(lesson: widget.lesson, id: widget.id, topic: widget.topic)), // Assuming LessonPage is defined
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: redirectToLessonDetailScreen,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(2, 3))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    widget.lesson.lessonNumber < 10
                        ? '0${widget.lesson.lessonNumber}'
                        : widget.lesson.lessonNumber.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.lesson.title.length > 20
                          ? '${widget.lesson.title.substring(0, 20)}...'
                          : widget.lesson.title,
                      style: const TextStyle(
                        color: Color(0XFF1F1F39),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.timelapse,
                          color: Color(0XFFB8B8D2),
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.lesson.duration} min',
                          style: const TextStyle(
                            color: Color(0XFFB8B8D2),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
               Container(
                child: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.blue,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
