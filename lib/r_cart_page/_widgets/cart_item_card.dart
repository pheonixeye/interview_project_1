import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/models/cart_item.dart';
import 'package:interview_project_1/providers/cart_p.dart';
import 'package:interview_project_1/styles/styles.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key, required this.item, required this.index})
      : super(key: key);
  final CartItem item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: Styles.REGULARCONTAINERBR,
        ),
        child: CachedNetworkImage(
          imageUrl: item.item.imgUrl,
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
      title: Text(item.item.name),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<PxCart>(
          init: PxCart(),
          autoRemove: false,
          builder: (px) {
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(item.item.unit.replaceAll("'", '')),
                    Text(
                      r'$' ' ' '${item.item.pricePerUnit.toString()}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        decoration: TextDecoration.combine(
                          [TextDecoration.lineThrough],
                        ),
                      ),
                    ),
                    Text(
                      r'$'
                      ' '
                      '${(item.item.pricePerUnit * (item.item.discount / 100)).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                FloatingActionButton.small(
                  backgroundColor: Colors.lightBlue,
                  onPressed: () {
                    px.modifyItemCount(index, Operation.decrement);
                  },
                  heroTag: item.item.name,
                  child: const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.count.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FloatingActionButton.small(
                  backgroundColor: Colors.lightBlue,
                  onPressed: () {
                    px.modifyItemCount(index, Operation.increment);
                  },
                  heroTag: item.item.description,
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
