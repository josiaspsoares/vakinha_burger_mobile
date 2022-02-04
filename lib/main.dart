import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/app_bindings.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/orders_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/product_routers.dart';
import 'app/core/ui/app_ui.dart';
import 'app/routes/home_routers.dart';
import 'app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: AppUI.theme,
      initialBinding: AppBindings(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouters.routers,
      ],
    );
  }
}
