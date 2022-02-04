import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_cart_controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  ShoppingCartPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
                minWidth: constrains.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Visibility(
                    visible: controller.products.isNotEmpty,
                    replacement: Center(
                      child: Text(
                        'Nenhum produto no carrinho',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Carrinho',
                                style: context.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.primaryColorDark,
                                ),
                              ),
                              IconButton(
                                onPressed: controller.clear,
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Column(
                            children: controller.products
                                .map(
                                  (item) => Container(
                                    margin: const EdgeInsets.all(10),
                                    child: PlusMinusBox(
                                      label: item.product.name,
                                      calculateTotal: true,
                                      elevated: true,
                                      backgroundColor: Colors.white,
                                      quantity: item.quantity,
                                      price: item.product.price,
                                      minusCallback: () {
                                        controller
                                            .removeProductInShoppingCart(item);
                                      },
                                      plusCallback: () {
                                        controller
                                            .addProductInShoppingCart(item);
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total do pedido',
                                style: context.textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.primaryColorDark,
                                ),
                              ),
                              Obx(() {
                                return Text(
                                  FormatterHelper.formatCurrency(
                                    controller.totalValue,
                                  ),
                                  style: context.textTheme.subtitle1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        const Divider(),
                        const _AddressField(),
                        const Divider(),
                        const _CpfField(),
                        const Divider(),
                        const Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: CustomButton(
                              text: 'FINALIZAR',
                              onPressed: () {
                                final formValid =
                                    _formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  controller.createOrder();
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCartController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Expanded(
              child: Text(
                'Endereço de entrega',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite o endereço de entrega',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCartController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Expanded(
              child: Text(
                'CPF',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigatório'),
              Validatorless.cpf('CPF inválido'),
            ]),
            decoration: const InputDecoration(
              hintText: 'Digite seu CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
