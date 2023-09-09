import 'package:elredio_assignment_2/resource/resource.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class DialogUtils {
  ///
  static void showLoadingDialog() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ////
              const CircularProgressIndicator(
                color: AppColors.paleBlack,
              ),

              ///
              const SizedBox(
                width: 20.0,
              ),

              ///
              Text(
                AppStrings.loading,
                style: AppTextStyle.blackTextStyle,
              )
            ],
          ),
        );
      },
    );
  }

  ///
  static void closeDialog() {
    navigatorKey.currentState?.pop();
  }

  ///
  static void showMessage({
    required String message,
  }) {
    ///
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.paleBlue,
        content: Text(
          message,
          style: AppTextStyle.smallBlackTextStyle,
        ),
      ),
    );
  }
}
