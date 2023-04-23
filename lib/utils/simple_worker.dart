import 'package:flutter_easyloading/flutter_easyloading.dart';

class SimpleWorker {
  final Function() task;
  Function<R>(R res)? onCompleted;
  Function(Exception)? onError;

  SimpleWorker({required this.task, this.onCompleted, this.onError});

  void start() async {
    try {
      EasyLoading.show(status: 'loading...');
      var res = await task();
      onCompleted!(res);
      EasyLoading.dismiss();
    } on Exception catch (e) {
      EasyLoading.dismiss();
      onError!(e);
    }
  }
}
