import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_app_bar.dart';
import 'package:vakinha_burger_mobile/app/models/pix_payment_model.dart';

class PixPage extends StatelessWidget {
  final PixPaymentModel _pixPayment = Get.arguments;
  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCode = Uri.parse(_pixPayment.image).data;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor a pagar',
                  style: context.textTheme.headline5,
                ),
                Text(FormatterHelper.formatCurrency(_pixPayment.totalValue),
                    style: context.textTheme.headline4?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    )),
                Image.memory(
                  qrCode!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 50),
                ),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _pixPayment.code));
                    Get.rawSnackbar(
                      message: 'Código PIX copiado',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: Text(
                    'PIX COPIA E COLA',
                    style: context.textTheme.headline4?.copyWith(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
