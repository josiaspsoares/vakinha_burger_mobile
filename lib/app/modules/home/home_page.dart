import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_app_bar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/icon_badge.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Navigator(
          initialRoute: '/menu',
          key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            onTap: (value) => controller.tabIndex = value,
            currentIndex: controller.tabIndex,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Produtos',
              ),
              BottomNavigationBarItem(
                icon: IconBadge(
                    number: controller.totalProductsInShoppingCart,
                    icon: Icons.shopping_cart),
                label: 'Carrinho',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app),
                label: 'Sair',
              ),
            ],
          );
        }));
  }
}
