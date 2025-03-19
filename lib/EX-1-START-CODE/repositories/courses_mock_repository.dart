import '../models/course.dart';
import 'courses_repository.dart';

class CoursesMockRepository implements CoursesRepository {
  final List<Course> _courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA')
  ];

  @override
  List<Course> getCourses() {
    return _courses;
  }

  @override
  void addScore(Course course, CourseScore score) {
    final courseIndex = _courses.indexWhere((c) => c.name == course.name);
    if (courseIndex != -1) {
      _courses[courseIndex].addScore(score);
    }
  }
    @override
  void deleteCourse(String courseId) {
    _courses.removeWhere((course) => course.name == courseId);
  }
}