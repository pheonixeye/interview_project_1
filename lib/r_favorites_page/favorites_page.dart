import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/providers/favorites_p.dart';
import 'package:interview_project_1/r_category_items_page/_widgets/category_item_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PxFavorites>(
      init: PxFavorites(),
      autoRemove: false,
      builder: (px) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Favorites',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: px.favorites.length,
            itemBuilder: (context, index) {
              return CategoryItemCard(
                item: px.favorites[index],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'clrfavs',
            child: const Icon(Icons.clear_all),
            onPressed: () {
              px.clearFavorites();
            },
          ),
        );
      },
    );
  }
}
