import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadmap/components/course_description_page/course_lesson_card.dart';
import 'package:roadmap/data/my_colors.dart';
import 'package:roadmap/widget/my_text.dart';
import 'package:roadmap/providers/models/course.dart';

class CourseDescripetionScreen extends StatefulWidget {
  final Course course;
  CourseDescripetionScreen({required this.course});

  @override
  CourseDescripetionScreenState createState() =>
      CourseDescripetionScreenState();
}

class CourseDescripetionScreenState extends State<CourseDescripetionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: const Color(0xff0192CC),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
              ),
              expandedHeight: 120.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(color: const Color(0xff0192CC)),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                  color: Colors.white,
                ), // overflow menu
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            color: MyColors.grey_10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 180,
                  color: const Color(0xff0192CC),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -180.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFD301),
                                  borderRadius: BorderRadius.circular(5)),
                              padding:
                                  const EdgeInsets.only(right: 20, left: 5),
                              child: Text("BESTSELLER",
                                  style: MyText.headline(context)!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(widget.course.title,
                                  style: MyText.headline(context)!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text(
                                        widget.course.category,
                                        style: MyText.headline(context)!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${widget.course.review}",
                                        style: MyText.headline(context)!
                                            .copyWith(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Color(0XFFFFD301),
                                        size: 20,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "6hr 30min",
                                        style: MyText.body1(context)!.copyWith(
                                            color: MyColors.grey_60,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 5,
                                        color: MyColors.grey_60,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${widget.course.lessons.length} lessons",
                                        style: MyText.body1(context)!.copyWith(
                                            color: MyColors.grey_60,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "About this course",
                                        style: MyText.headline(context)!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                      ),
                                      Text(
                                        widget.course.description,
                                        style: MyText.body1(context)!.copyWith(
                                            color: MyColors.grey_60,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children:
                                        widget.course.lessons.map((lesson) {
                                      return CourseDescriptionCard(
                                          lesson: lesson,
                                          id: widget.course.courseId,
                                          topic: widget.course.title);
                                    }).toList(),
                                  ),
                                ],
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
