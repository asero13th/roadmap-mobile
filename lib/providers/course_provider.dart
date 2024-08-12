import 'package:flutter/material.dart';
import 'package:roadmap/providers/models/course.dart';
import 'package:roadmap/providers/models/lesson.dart';
import 'package:roadmap/providers/services/course_service.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];
  List<Course> _searchedCourses = [];
  List<Lesson> _lessons = [];
  Lesson? _lesson;
  Course? _course;
  bool _isLoading = false;
  bool _isCourseLoading = false;

  List<Course> get courses => _courses;
  List<Course> get searchedCourses => _searchedCourses;
  List<Lesson> get lessons => _lessons;
  Lesson? get lesson => _lesson;
  Course? get course => _course;
  bool get isCourseLoading => _isCourseLoading;
  bool get isLoading => _isLoading;

  Future<void> fetchCourses() async {
   
    _isLoading = true;
    notifyListeners();

    try {
      _courses = await CourseService().fetchCourses();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCourseById(int id) async {
    _isCourseLoading = true;
    notifyListeners();

    try {
      _course = await CourseService().fetchCourseById(id);
      _lessons = _course?.lessons ?? [];
    } catch (e) {
      // Handle error
    } finally {
      _isCourseLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchCourses(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _searchedCourses = await CourseService().searchCourses(query);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createCourse(String skill) async {
    _isLoading = true;
    notifyListeners();

    try {
      await CourseService().createCourse(skill);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getLessonDetail(
      int id, int lessonNumber, String title, String topic) async {
    _isLoading = true;
    notifyListeners();

    try {
      _lesson =
          await CourseService().getLessonDetail(id, lessonNumber, title, topic);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
