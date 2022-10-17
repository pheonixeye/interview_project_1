class CategoryItem {
  final int id;
  final String name;
  final String description;
  final String unit;
  final double pricePerUnit;
  final double discount;
  final int availableUnits;
  final String imgUrl;

  CategoryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.unit,
    required this.pricePerUnit,
    required this.discount,
    required this.availableUnits,
    required this.imgUrl,
  });

  static CategoryItem fromJson(dynamic json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      unit: json['unit'],
      pricePerUnit: json['priceperunit'],
      discount: json['discount'],
      availableUnits: json['availableunits'],
      imgUrl: json['imgurl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unit': unit,
      'priceperunit': pricePerUnit,
      'discount': discount,
      'availableunits': availableUnits,
      'imgurl': imgUrl,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  static List<CategoryItem> categoryItemList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => CategoryItem.fromJson(e)).toList();
  }

  static List<dynamic> categoryItemListToJson(List<CategoryItem>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }
}
