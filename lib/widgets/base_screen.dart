import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BaseScreen extends StatelessWidget {
  Widget child;
  Function()? onWillPop;

  BaseScreen({Key? key, required this.child, this.onWillPop}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    return !EasyLoading.isShow;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return _onWillPop(context);
        },
        child: child);
  }
}
