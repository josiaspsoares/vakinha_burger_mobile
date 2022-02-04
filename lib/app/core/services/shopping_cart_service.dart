import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_cart_model.dart';

class ShoppingCartService extends GetxService {
  final _shoppingCart = <int, ShoppingCartModel>{}.obs;

  List<ShoppingCartModel> get products => _shoppingCart.values.toList();

  int get totalProducts => _shoppingCart.values.length;

  ShoppingCartModel? getById(int id) => _shoppingCart[id];

  double get totalValue {
    return _shoppingCart.values.fold(
      0,
      (total, item) => total + item.product.price * item.quantity,
    );
  }

  void addAndRemoveProductInShoppingCart(ProductModel product,
      {required quantity}) {
    if (quantity > 0) {
      _shoppingCart.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCartModel(product: product, quantity: quantity);
      });
    } else {
      _shoppingCart.remove(product.id);
    }
  }

  void clear() {
    _shoppingCart.clear();
  }
}
