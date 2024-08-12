import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:roadmap/data/my_colors.dart';
import 'package:roadmap/providers/models/lesson.dart';
import 'package:roadmap/screens/course_description.dart';
import '../components/homepage/gradient_progress_indicator.dart';
import '../components/homepage/horizontal_scrolling.dart';
import '../components/homepage/learning_plans.dart';
import "package:roadmap/providers/models/course.dart";
import 'package:roadmap/providers/models/lesson.dart';
import 'package:roadmap/screens/course_description.dart';
import 'package:roadmap/data/dummy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0192CC),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          decoration: const BoxDecoration(
                            color: Color(0xff0192CC),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Hello, ' + 'John',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Let\'s start Learning today',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 30),
                                  height: 70,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/profile.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.only(top: 90),
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 110,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ]),
                              child: const Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, top: 20, right: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Learning Today',
                                          style: TextStyle(
                                            color: Color(0xFF858597),
                                            fontSize: 15,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.whatshot_outlined,
                                              semanticLabel: 'streak',
                                              color: Color(0xFF858597),
                                            ),
                                            Text(
                                              '4',
                                              style: TextStyle(
                                                color: Color(0xFF858597),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          '46' + 'min',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ' / ',
                                          style: TextStyle(
                                            color: Color(0xFF858597),
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '60' + 'min',
                                          style: TextStyle(
                                            color: Color(0xFF858597),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, right: 20),
                                    child: GradientProgressIndicator(
                                      value: 0.7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const HorizontalScrolling(),
                    const LearningPlan(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          showSheet(context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Color(0xff0192CC)),
                        child: const Row(
                          children: [
                            Text(
                              'Generate Course using AI',
                              style: TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                            Spacer(),
                            Icon(
                              Icons.auto_awesome,
                              color: Color(0XFFFFFFFF),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}

void showSheet(context) {
  TextStyle(color: Colors.white, height: 1.4, fontSize: 16);
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Enter topic",
                          style: TextStyle(
                            color: Colors.grey[700],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: myBoxDecoration(),
                        child: const Stack(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Enter topic",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        )))),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.expand_more,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Enter age",
                          style: TextStyle(
                            color: Colors.grey[700],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: myBoxDecoration(),
                        child: const Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Enter age",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          )))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.expand_more,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: double.infinity, // match_parent
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.primary,
                          ),
                          child: const Text(
                            "SUBMIT",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDescripetionScreen(
                                    course: Course(
                                        courseId: 9,
                                        title:
                                            "Mastering Machine Learning with Python",
                                        description:
                                            "A comprehensive roadmap for learning Machine Learning with Python, covering fundamental concepts, algorithms, and practical applications.",
                                        category: "Machine Learning",
                                        courseColor: "0XFF3D5CFF",
                                        review: 0,
                                        lessons: List<Lesson>.generate(
                                            5,
                                            (index) => Lesson(
                                                title: "Lesson ${index + 1}",
                                                content:
                                                    "Lesson content ${index + 1}",
                                                duration: 10,
                                                videoLink:
                                                    "https://www.youtube.com/watch?v=ZVY3fU0b9lU",
                                                lessonNumber: index + 1,
                                                detailExplanation: "")))),
                              ),
                            );
                          },
                        ),
                      )),
                  Container(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        );
      });
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
        width: 1, //
        color: Colors.grey[400]! //                  <--- border width here
        ),
  );
}
