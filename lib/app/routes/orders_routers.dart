import 'package:get/get.dart';

import '../modules/order/checkout/checkout_page.dart';
import '../modules/order/pix/pix_page.dart';

class OrdersRouters {
  OrdersRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/orders/checkout',
      page: () => CheckoutPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    ),
  ];
}
