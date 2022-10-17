import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/models/category_item.dart';
import 'package:interview_project_1/providers/cart_p.dart';
import 'package:interview_project_1/providers/favorites_p.dart';
import 'package:interview_project_1/styles/styles.dart';

class DealOfTheDayCard extends StatelessWidget {
  const DealOfTheDayCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      elevation: 0,
      child: SizedBox(
        width: Get.size.shortestSide * 0.8,
        height: Get.size.longestSide * 0.15,
        child: Row(
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  width: Get.size.longestSide * 0.15,
                  height: Get.size.longestSide * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: Styles.REGULARCONTAINERBR,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: item.imgUrl,
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
                GetBuilder<PxFavorites>(
                  autoRemove: false,
                  init: PxFavorites(),
                  builder: (px) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: FloatingActionButton.small(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        heroTag: item.name,
                        child: px.isInFavorites(item)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border_outlined,
                              ),
                        onPressed: () {
                          if (px.isInFavorites(item)) {
                            px.RemoveItemFromFavorites(item.id);
                          } else {
                            px.addItemToFavorites(item);
                          }
                        },
                      ),
                    );
                  },
                ),
                GetBuilder<PxCart>(
                  autoRemove: false,
                  init: PxCart(),
                  builder: (px) {
                    return Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton.small(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        heroTag: item.description,
                        child: px.isInCart(item)
                            ? const Icon(
                                Icons.shopping_cart_checkout,
                                color: Colors.orange,
                              )
                            : const Icon(
                                Icons.add_shopping_cart_rounded,
                              ),
                        onPressed: () {
                          if (px.isInCart(item)) {
                            px.removeItemFromCart(px.cartItems.indexOf(
                                px.cartItems.firstWhere(
                                    (element) => element.item == item)));
                          } else {
                            px.addItemToCart(item);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${'${item.unit.substring(1, item.unit.length - 1)}s'} ${item.availableUnits}',
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${Random().nextInt(30) + 5} Minutes Away'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          r'$'
                          ' '
                          '${(item.pricePerUnit * (item.discount / 100)).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          r'$' ' ' '${item.pricePerUnit}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.combine(
                              [
                                TextDecoration.lineThrough,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
