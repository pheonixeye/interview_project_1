import 'package:get/get.dart';
import 'package:interview_project_1/models/category.dart';

class PxSelectedCategory extends GetxController {
  Category? category;

  void selectCategory(Category? val) {
    if (val == null) category = null;
    category = Category.fromJson(val!.toJson());
    update();
  }
}
