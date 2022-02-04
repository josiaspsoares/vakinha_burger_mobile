import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/pix_payment_model.dart';

import 'package:vakinha_burger_mobile/app/models/order_model.dart';

import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<PixPaymentModel> createOrder(OrderModel order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map(
            (item) => {
              'quantity': item.quantity,
              'productId': item.product.id,
            },
          )
          .toList(),
    });

    if (result.hasError) {
      log(
        'Erro ao realizar pedido (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message: 'Erro ao realizar pedido');
    }

    return PixPaymentModel.fromMap(result.body);
  }
}
