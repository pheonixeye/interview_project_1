import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_project_1/providers/category_json_p.dart';
import 'package:interview_project_1/providers/selected_category_p.dart';
import 'package:interview_project_1/styles/styles.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PxCategory>(
        init: PxCategory(),
        autoRemove: false,
        builder: (px) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100,
            ),
            itemCount: px.category.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: Styles.REGULARCONTAINERBR,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: px.category[index].imgUrl,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                title: Text(px.category[index].title),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${px.category[index].items.length} Items'),
                ),
                onTap: () {
                  Get.put(PxSelectedCategory())
                      .selectCategory(px.category[index]);
                  GoRouter.of(context).go('/categoriespage/items');
                },
              );
            },
          );
        },
      ),
    );
  }
}
