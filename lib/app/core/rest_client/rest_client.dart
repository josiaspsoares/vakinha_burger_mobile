import 'package:get/get.dart';

class RestClient extends GetConnect {
  final String _baseUrl = "http://dartweek.academiadoflutter.com.br";

  RestClient() {
    httpClient.baseUrl = _baseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  RestClientException({
    this.code,
    required this.message,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
