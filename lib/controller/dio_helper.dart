import 'package:dio/dio.dart';

class ApiRepo {
  Dio? _dio;
  String url;
  Map<String, dynamic>? payload;

  ApiRepo({required this.url, this.payload});

  void getData({
    Function()? beforeSend,
    Function(Map<String, dynamic> error)? onError,
    Function(Map<String, dynamic> data)? onSuccess,
  }) {
    _dio!.get(url, queryParameters: payload).then((value) {
      if (onSuccess != null) {
        onSuccess(value.data);
      }
    }).catchError((error) {
      onError!(error);
    });
  }
}
