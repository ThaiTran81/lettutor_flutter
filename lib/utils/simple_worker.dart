import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lettutor_flutter/utils/dialog_utils.dart';

typedef Callback<T> = Function(T data);

class SimpleWorker<T> {
  final Function() task;
  Callback<T>? onCompleted;
  Function(Exception)? onError;

  SimpleWorker({required this.task, this.onCompleted, this.onError});

  void start() async {
    try {
      EasyLoading.show(status: 'loading...');
      if (T == Null) {
        await task();
      } else {
        var res = await task();
        onCompleted!(res);
      }
      EasyLoading.dismiss();
    } on Exception catch (e) {
      EasyLoading.dismiss();
      // processLoginError(, e);
      onError!(e);
    }
  }

  void processLoginError(BuildContext context, Exception err) {
    if (err is DioError) {
      DioError dioError = err;
      var res = dioError.response?.data;

      if (res['statusCode'] == 400) {
        DialogUtils.showInform(context: context, msgBody: res['message']);
      }
    } else {
      DialogUtils.showInform(context: context, msgBody: err.toString());
    }
  }
}
