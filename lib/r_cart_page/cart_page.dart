import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_project_1/providers/cart_p.dart';
import 'package:interview_project_1/r_cart_page/_widgets/cart_item_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PxCart>(
      init: PxCart(),
      builder: (px) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: px.cartItems.length,
            itemBuilder: (context, index) {
              return CartItemCard(
                item: px.cartItems[index],
                index: index,
              );
            },
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'chkout',
                  child: const Icon(Icons.price_check_outlined),
                  onPressed: () {
                    GoRouter.of(context).go('/checkout');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'clrcart',
                  child: const Icon(Icons.clear_all),
                  onPressed: () {
                    px.clearCart();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
