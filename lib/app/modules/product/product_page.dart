import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/app_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_app_bar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import '../../core/ui/widgets/custom_button.dart';
import './product_controller.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(
                      reducedBy: 60,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                      quantity: controller.quantity,
                      price: controller.product.price,
                      minusCallback: controller.removeProduct,
                      plusCallback: controller.addProduct,
                    );
                  }),
                  const Divider(),
                  ListTile(
                      title: const Text(
                        'Total',
                        style: AppUI.textBold,
                      ),
                      trailing: Obx(() {
                        return Text(
                          FormatterHelper.formatCurrency(controller.totalPrice),
                          style: AppUI.textBold,
                        );
                      })),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: CustomButton(
                        text: controller.alreadyInCart
                            ? 'ATUALIZAR'
                            : 'ADICIONAR',
                        onPressed: controller.addProductToShoppingCart,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
