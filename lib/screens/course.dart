import 'package:flutter/material.dart';
import 'package:roadmap/components/coursepage/horizontal_scrollable_card.dart';
import 'package:roadmap/components/coursepage/course_header.dart';
import 'package:roadmap/components/coursepage/course_card.dart';

import 'package:provider/provider.dart';
import 'package:roadmap/providers/course_provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    // ------------> A function that will redirect the user to the course description page when called <-----------------

    void initState() {
      super.initState();
      // Fetch courses when the widget is first created
      Provider.of<CourseProvider>(context, listen: false).fetchCourses();
    }

    return ChangeNotifierProvider(
      create: (context) => CourseProvider()..fetchCourses(),
      child: Scaffold(
        body: Consumer<CourseProvider>(
          builder: (context, courseProvider, child) {
            if (courseProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final courses = courseProvider.courses;

            return Padding(
              // Add return here
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CourseHeader(),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0XFFF4F3FD),
                            prefixIconColor: Color(0XFFB8B8D2),
                            suffixIconColor: Color(0XFFB8B8D2),
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.filter_list),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            HorizontalScrollableCard(
                                imageUrl: AssetImage(
                                    'assets/images/illustration_3.png'),
                                text: "Language",
                                color: Color(0XFFCEECFE),
                                textColor: Color(0XFF3D5CFF)),
                            HorizontalScrollableCard(
                                imageUrl: AssetImage(
                                    'assets/images/illustration_4.png'),
                                text: "Painting",
                                color: Color(0XFFEFE0FF),
                                textColor: Color(0XFF9065BE)),
                            // Add more cards as needed
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Choose your course',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          ChoiceChip(
                            selected: true,
                            selectedColor: Color(0xff0192CC),
                            label: Text('All',
                                style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(width: 10),
                          ChoiceChip(
                            selected: false,
                            selectedColor: Color(0xff0192CC),
                            label: Text('Popular'),
                          ),
                          SizedBox(width: 10),
                          ChoiceChip(
                            selected: false,
                            selectedColor: Color(0xff0192CC),
                            label: Text('New'),
                          ),
                          // Add more chips as needed
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(courses.length, (index) {
                            final course = courses[index];
                     
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CourseCard(
                                  course:
                                      course, // Pass the course data to the CourseCard
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
