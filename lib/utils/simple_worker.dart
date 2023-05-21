import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

typedef Callback<T> = Function(T data);

class SimpleWorker<T> {
  final Function() task;

  String? messageOnSuccess;
  Callback<T>? onCompleted;
  Function(dynamic)? onError;
  Callback<DioError?>? onErrorResponse;
  Map<int, String>? messageBasedOnStatutCode = {};

  SimpleWorker(
      {required this.task,
      this.onCompleted,
      this.onError,
      this.messageOnSuccess,
      this.messageBasedOnStatutCode,
      this.onErrorResponse});

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

      if (messageOnSuccess != null) {
        EasyLoading.showSuccess(messageOnSuccess!);
      }
    } catch (e) {
      EasyLoading.dismiss();
      // processLoginError(, e);
      print(e.toString());

      processLoginError(e);
      if (onError != null) {
        onError!(e);
      }
      rethrow;
    }
  }

  void processLoginError(dynamic err) {
    if (err is DioError) {
      DioError dioError = err;
      if (onErrorResponse != null) {
        onErrorResponse!(dioError);
      }
      var res = dioError.response?.data;

      final messageBasedOnStatutCode = this.messageBasedOnStatutCode;
      if (messageBasedOnStatutCode != null) {
        var statutCode = messageBasedOnStatutCode.keys
            .where((key) => res['statusCode'] == key)
            .first;
        statutCode != null
            ? EasyLoading.showError(messageBasedOnStatutCode[statutCode] ?? '')
            : EasyLoading.showError(
                "Oops!! Something went wrong! please try again");
      }
    } else {
      EasyLoading.showError("Oops!! Something went wrong! please try again");
    }
  }
}
