import '../../models/order_model.dart';
import '../../models/pix_payment_model.dart';

abstract class OrderRepository {
  Future<PixPaymentModel> createOrder(OrderModel order);
}
