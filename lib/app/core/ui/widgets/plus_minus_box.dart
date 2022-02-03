import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';

import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    Key? key,
    required this.quantity,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.elevated = false,
    this.calculateTotal = false,
    this.backgroundColor,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(children: [
          Visibility(
            visible: label != null,
            child: Text(
              label ?? '',
              style: const TextStyle(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomRoundedButton(
                text: '-',
                onPressed: minusCallback,
              ),
              Text(quantity.toString()),
              CustomRoundedButton(
                text: '+',
                onPressed: plusCallback,
              ),
            ],
          ),
          Visibility(
            visible: label == null,
            child: const Spacer(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            constraints: const BoxConstraints(
              minWidth: 70,
            ),
            child: Text(
              FormatterHelper.formatCurrency(
                  calculateTotal ? price * quantity : price),
            ),
          )
        ]),
      ),
    );
  }
}
