import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/models/category_item.dart';
import 'package:interview_project_1/providers/cart_p.dart';
import 'package:interview_project_1/providers/favorites_p.dart';
import 'package:interview_project_1/styles/styles.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({Key? key, required this.item}) : super(key: key);
  final CategoryItem item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: Container(
          width: 50,
          height: 50,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: Styles.REGULARCONTAINERBR,
          ),
          child: CachedNetworkImage(
            imageUrl: item.imgUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                SizedBox(
              height: 20,
              width: 20,
              child: Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
        title: Text(item.name.toUpperCase()),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(item.description),
              const Divider(),
              Row(
                children: [
                  const Icon(
                    Icons.price_check_sharp,
                    color: Colors.green,
                  ),
                  Text('${item.pricePerUnit} USD / ${item.unit.toUpperCase()}')
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Icon(
                    Icons.percent,
                    color: Colors.blue,
                  ),
                  Text('${item.discount} % - ${item.availableUnits} Available.')
                ],
              ),
              const Divider(),
            ],
          ),
        ),
        trailing: Column(
          children: [
            GetBuilder<PxFavorites>(
                init: PxFavorites(),
                autoRemove: false,
                builder: (px) {
                  return InkWell(
                    child: px.isInFavorites(item)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                          ),
                    onTap: () {
                      if (px.isInFavorites(item)) {
                        px.RemoveItemFromFavorites(item.id);
                      } else {
                        px.addItemToFavorites(item);
                      }
                    },
                  );
                }),
            const Spacer(),
            GetBuilder<PxCart>(
              init: PxCart(),
              autoRemove: false,
              builder: (px) {
                return InkWell(
                  onTap: () {
                    if (px.isInCart(item)) {
                      px.removeItemFromCart(px.cartItems.indexOf(px.cartItems
                          .firstWhere((element) => element.item == item)));
                    } else {
                      px.addItemToCart(item);
                    }
                  },
                  child: px.isInCart(item)
                      ? const Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.orange,
                        )
                      : const Icon(
                          Icons.add_shopping_cart_rounded,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
