import 'package:interview_project_1/models/category_item.dart';

class CartItem {
  final CategoryItem item;
  final int count;

  CartItem({
    required this.item,
    required this.count,
  });

  static CartItem fromJson(dynamic json) {
    return CartItem(
      item: CategoryItem.fromJson(json['item']),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'count': count,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  static List<CartItem> cartItemsListFromJson(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => CartItem.fromJson(e)).toList();
  }

  static List<dynamic> cartItemsListtoJson(List<CartItem>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }
}
