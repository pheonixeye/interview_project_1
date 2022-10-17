import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/models/category.dart';
import 'package:interview_project_1/models/category_item.dart';
import 'package:path_provider/path_provider.dart';

class PxCategory extends GetxController {
  List<Category> category = [];

  Future fetchCategories() async {
    String data = await rootBundle.loadString('assets/db.json');
    var decoded = json.decode(data);
    category = Category.categoryList(decoded);
    update();
  }

  @override
  void onInit() {
    fetchCategories().whenComplete(() {
      makeDealOfTheDay();
      makeMegaDeal();
    });
    super.onInit();
  }

  List<CategoryItem> dotd = [];

  void makeDealOfTheDay() {
    if (category.isNotEmpty) {
      category.map((e) {
        var listLength = e.items.length;
        var randomIndex = Random.secure().nextInt(listLength);
        var item = e.items.elementAt(randomIndex);
        dotd.add(item);
      }).toList();
      update();
    }
  }

  CategoryItem? megaDeal;

  void makeMegaDeal() {
    if (dotd.isNotEmpty) {
      megaDeal = dotd[Random.secure().nextInt(dotd.length)];
      while (megaDeal!.name.contains('-') ||
          megaDeal!.name.split(' ').length < 2) {
        megaDeal = dotd[Random.secure().nextInt(dotd.length)];
      }
      update();
    }
  }

  Future mod() async {
    var dir = await getExternalCacheDirectories();
    var path = dir!.first;
    print(path);
    var file = File('${path.path}/db.json');
    await file.create();
    var data = await rootBundle.loadString('assets/data.json');
    var decoded = json.decode(data);

    List<Category> _cats = Category.categoryList(decoded);
    var toBeWritten = json.encode(Category.categoryListToJson(_cats));

    await file.writeAsString(toBeWritten.toString());

    var postWrite1 = await file.readAsString();
    var d1 = json.decode(postWrite1);

    List<Category> cats = Category.categoryList(d1);

    List<Category> newCat = [];

    cats.map((e) {
      var r1 = Random.secure().nextInt(250) + 50;
      var r2 = Random.secure().nextInt(250) + 50;
      var picsumString = 'https://picsum.photos/$r1/$r2';

      newCat.insert(
        0,
        Category(
          id: e.id,
          title: e.title,
          imgUrl: picsumString,
          items: e.items.map((c) {
            var c1 = Random.secure().nextInt(250) + 50;

            var c2 = Random.secure().nextInt(250) + 50;

            return CategoryItem(
              id: c.id,
              name: c.name,
              description: c.description,
              unit: c.unit,
              pricePerUnit: c.pricePerUnit,
              discount: c.discount,
              availableUnits: c.availableUnits,
              imgUrl: 'https://picsum.photos/$c1/$c2',
            );
          }).toList(),
        ),
      );
    }).toList();

    var newcatstring = jsonEncode(newCat);

    await file.writeAsString(newcatstring);

    // var newFile = File('e:\\db.json');

    // await newFile.create();

    // await newFile.writeAsString(newcatstring);

    print('done');
  }
}
