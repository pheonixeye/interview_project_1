import 'package:interview_project_1/models/category_item.dart';

class Category {
  final int id;
  final String title;
  final String imgUrl;
  final List<CategoryItem> items;
  Category({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.items,
  });

  static Category fromJson(dynamic json) {
    return Category(
      id: json['id'],
      title: json['title'],
      imgUrl: json['imgurl'],
      items: CategoryItem.categoryItemList(json['items']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imgurl': imgUrl,
      'items': CategoryItem.categoryItemListToJson(items),
    };
  }

  static List<Category> categoryList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Category.fromJson(e)).toList();
  }

  static List<dynamic> categoryListToJson(List<Category>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
