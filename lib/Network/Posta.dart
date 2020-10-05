import 'package:dio/dio.dart';
import 'package:load/load.dart';


BaseOptions options = new BaseOptions(
  baseUrl: "http://hgepublicgateway.ir",
  connectTimeout: 10000,
  receiveTimeout: 3000,
);

var dio = new Dio(options=options);


posta(
    {
      url = '',
      Object data,
      Function onSuccess,
      Function onError,
      hasLoading = true,
      successMessage = 'عملیات موفق',
      errorMessage = 'خطا در عملیات'}) async {

  try {
    showLoadingDialog(tapDismiss: false);
    print(url);
    Response response = await dio.post(url);
    hideLoadingDialog();
    onSuccess(response);
  } catch (e) {
    hideLoadingDialog();
    print(e);

  }
}


class Net {





  geta(Function onSuccess, Function onFail,
      {url = '',
      hasLoading = true,
      successMessage = 'عملیات موفق',
      errorMessage = 'خطا در عملیات'}) async {
    try {
      Response response = await dio.get(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  puta(Function onSuccess, Function onFail,
      {url = '',
      hasLoading = true,
      successMessage = 'عملیات موفق',
      errorMessage = 'خطا در عملیات'}) async {
    try {
      Response response = await dio.put(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  deleta(Function onSuccess, Function onFail,
      {url = '',
      hasLoading = true,
      successMessage = 'عملیات موفق',
      errorMessage = 'خطا در عملیات'}) async {
    try {
      Response response = await dio.delete(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
