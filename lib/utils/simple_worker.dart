import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      onError!(e);
    }
  }
}
