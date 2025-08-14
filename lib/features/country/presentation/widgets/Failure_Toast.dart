import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/error/failure.dart';

class FailureToast extends StatelessWidget {
  final Failure failure;

  const FailureToast({Key? key, required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      failure.when(
        network:
            (msg) => Fluttertoast.showToast(
              msg: "خطای شبکه: $msg",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              fontSize: 16.0,
            ),
        server:
            (msg) => Fluttertoast.showToast(
              msg: "خطای سرور: $msg",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            ),
        cache:
            (msg) => Fluttertoast.showToast(
              msg: "خطای کش: $msg",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.white,
              fontSize: 16.0,
            ),
      );
    });

    return SizedBox.shrink();
  }
}
