import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/providers/models/course.dart';
import 'package:roadmap/screens/course_description.dart';

class CourseCard extends StatefulWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  void redirectToCourseDescriptionpage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CourseDescripetionScreen(course: widget.course)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: redirectToCourseDescriptionpage,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(4, 6))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: 100,
                height: 120,
                child: Center(
                  child: Icon(
                    Icons.lock,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.course.title.length > 20
                          ? '${widget.course.title.substring(0, 20)}...'
                          : widget.course.title,
                      style: const TextStyle(
                        color: Color(0XFF1F1F39),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Color(0XFFB8B8D2),
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Gemini',
                          style: TextStyle(
                            color: Color(0XFFB8B8D2),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          '\$' + '190',
                          style: TextStyle(
                            color: Color(0XFF3D5CFF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0XFFFFEBF0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Center(
                              child: Text(
                                widget.course.category,
                                style: const TextStyle(
                                  color: Color(0XFFFF6905),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
