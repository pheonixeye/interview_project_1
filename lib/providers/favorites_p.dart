import 'package:get/get.dart';
import 'package:interview_project_1/models/category_item.dart';

class PxFavorites extends GetxController {
  List<CategoryItem> favorites = [];

  void addItemToFavorites(CategoryItem item) {
    favorites.insert(0, item);
    update();
  }

  void clearFavorites() {
    favorites.clear();
    update();
  }

  void RemoveItemFromFavorites(int id) {
    favorites.removeWhere((element) => element.id == id);
    update();
  }

  bool isInFavorites(CategoryItem item) => favorites.contains(item);
}
