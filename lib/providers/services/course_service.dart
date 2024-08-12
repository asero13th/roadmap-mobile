import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roadmap/providers/models/course.dart';
import 'package:roadmap/providers/models/lesson.dart';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    try {
      final response = await http
          .get(Uri.parse('https://roadmap-p1mm.onrender.com/api/course/'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> courses = jsonResponse['data'];
          return courses.map((course) {
            return Course.fromJson(course);
          }).toList();
        } else {
          throw Exception('Data key is missing or not a list');
        }
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print('Error fetching course: $e');
      return [];
    }
  }

  Future<Course> fetchCourseById(int id) async {
    final response =
        await http.get(Uri.parse('http://192.168.107.47:8000/api/course/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Course.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load course');
    }
  }

  Future<List<Course>> searchCourses(String query) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8000/api/course/search?search=${query.replaceAll(' ', '+')}'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to search courses');
    }
  }

  Future<Course> createCourse(String skill) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/course'),
      body: json.encode({'skill': skill}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Course.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to create course');
    }
  }

  Future<Lesson> getLessonDetail(
      int id, int lessonNumber, String title, String topic) async {
    final response = await http.patch(
      Uri.parse('https://roadmap-p1mm.onrender.com/api/course/update'),
      body: json.encode({
        'title': title,
        'topic': topic,
        'id': id,
        "lessonNumber": lessonNumber
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Lesson detail updated successfully');
      return Lesson.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update lesson detail');
    }
  }
}
