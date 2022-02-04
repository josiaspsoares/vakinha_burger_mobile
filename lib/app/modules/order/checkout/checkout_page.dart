import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_button.dart';
import 'package:vakinha_burger_mobile/app/models/pix_payment_model.dart';

class CheckoutPage extends StatelessWidget {
  final PixPaymentModel _pixPayment = Get.arguments;
  CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 70),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pedido realizado com sucesso, clique no botão abaixo para acesso o QRCode do PIX',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 40),
                  child: CustomButton(
                    text: 'PIX',
                    onPressed: () {
                      Get.toNamed('/orders/pix', arguments: _pixPayment);
                    },
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: context.widthTransformer(reducedBy: 20),
                  child: CustomButton(
                    text: 'FECHAR',
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
