import 'package:get/get.dart';

import 'package:vakinha_burger_mobile/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';

class ProductController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;
  final _alreadyInCart = false.obs;
  final ShoppingCartService _shoppingCartService;

  ProductController({
    required ShoppingCartService shoppingCartService,
  }) : _shoppingCartService = shoppingCartService;

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get alreadyInCart => _alreadyInCart.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final productShoppingCart = _shoppingCartService.getById(product.id);

    if (productShoppingCart != null) {
      _quantity(productShoppingCart.quantity);
      _alreadyInCart(true);
    }
  }

  void addProduct() {
    _quantity.value++;
  }

  void removeProduct() {
    if (_quantity.value > 1) {
      _quantity.value--;
    }
  }

  void addProductToShoppingCart() {
    _shoppingCartService.addAndRemoveProductInShoppingCart(product,
        quantity: quantity);
    Get.back();
  }
}
