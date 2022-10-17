import 'package:get/get.dart';
import 'package:interview_project_1/models/cart_item.dart';
import 'package:interview_project_1/models/category_item.dart';

class PxCart extends GetxController {
  List<CartItem> cartItems = [];

  void addItemToCart(CategoryItem item) {
    cartItems.insert(
      0,
      CartItem(
        item: item,
        count: 1,
      ),
    );
    update();
    updateTotalCartPrice();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    update();
    updateTotalCartPrice();
  }

  void clearCart() {
    cartItems.clear();
    update();
    updateTotalCartPrice();
  }

  void modifyItemCount(int index, Operation operation) {
    switch (operation) {
      case Operation.increment:
        cartItems[index] = CartItem(
            item: cartItems[index].item, count: cartItems[index].count + 1);
        update();
        break;

      case Operation.decrement:
        if (cartItems[index].count == 1) {
          removeItemFromCart(index);
        } else {
          cartItems[index] = CartItem(
              item: cartItems[index].item, count: cartItems[index].count - 1);
        }
        update();
        break;
    }
    updateTotalCartPrice();
  }

  double totalCartPrice = 0.0;

  void updateTotalCartPrice() {
    List<double> prices = [];
    cartItems.map((e) {
      double value = e.count * e.item.pricePerUnit * (e.item.discount / 100);
      prices.add(value);
    }).toList();
    totalCartPrice = prices.fold<double>(0, (p, e) => p + e);
    update();
  }

  bool isInCart(CategoryItem item) {
    if (cartItems.any((element) => element.item == item)) {
      return true;
    } else {
      return false;
    }
  }
}

enum Operation {
  increment,
  decrement;
}
