import 'package:get/get.dart';

import '../modules/product/product_bindings.dart';
import '../modules/product/product_page.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product',
      binding: ProductBindings(),
      page: () => const ProductPage(),
    ),
  ];
}
