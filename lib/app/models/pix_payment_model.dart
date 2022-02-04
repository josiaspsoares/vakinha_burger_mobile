import 'dart:convert';

class PixPaymentModel {
  String image;
  String code;
  double totalValue;
  PixPaymentModel({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'code': code,
      'totalValue': totalValue,
    };
  }

  factory PixPaymentModel.fromMap(Map<String, dynamic> map) {
    return PixPaymentModel(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixPaymentModel.fromJson(String source) =>
      PixPaymentModel.fromMap(json.decode(source));

  PixPaymentModel copyWith({
    String? image,
    String? code,
    double? totalValue,
  }) {
    return PixPaymentModel(
      image: image ?? this.image,
      code: code ?? this.code,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
