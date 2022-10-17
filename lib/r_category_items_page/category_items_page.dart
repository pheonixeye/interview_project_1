import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_project_1/providers/bot_nav_index.dart';
import 'package:interview_project_1/providers/cart_p.dart';
import 'package:interview_project_1/providers/selected_category_p.dart';
import 'package:interview_project_1/r_category_items_page/_widgets/category_item_card.dart';

class CategoryItemsPage extends StatelessWidget {
  const CategoryItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: PxSelectedCategory(),
        builder: (px) {
          while (px.category == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: px.category!.items.length,
            itemBuilder: (context, index) {
              return CategoryItemCard(item: px.category!.items[index]);
            },
          );
        },
      ),
      floatingActionButton: GetBuilder<PxBotNavIndex>(
        init: PxBotNavIndex(),
        autoRemove: false,
        builder: (px) {
          return FloatingActionButton(
            heroTag: 'proceedtocheckout',
            child: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              GoRouter.of(context).go('/');
              px.selectIndex(3);
            },
          );
        },
      ),
    );
  }
}
