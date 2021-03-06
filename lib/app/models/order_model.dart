import 'dart:convert';

import 'package:vakinha_burger_mobile/app/models/shopping_cart_model.dart';

class OrderModel {
  int userId;
  String cpf;
  String address;
  List<ShoppingCartModel> items;
  OrderModel({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'cpf': cpf,
      'address': address,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userId: map['userId']?.toInt() ?? 0,
      cpf: map['cpf'] ?? '',
      address: map['address'] ?? '',
      items: List<ShoppingCartModel>.from(
          map['items']?.map((x) => ShoppingCartModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
