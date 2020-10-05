import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://www.xx.com/api",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);


Dio Dia = new Dio(options);


BaseOptions mainOptions = new BaseOptions(
  baseUrl: "https://apione.mosharekatha.ir",
  connectTimeout: 20000,
  receiveTimeout: 20000,
);


Dio MainDio = new Dio(mainOptions);