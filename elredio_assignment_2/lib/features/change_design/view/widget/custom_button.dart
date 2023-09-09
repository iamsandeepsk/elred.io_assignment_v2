import 'package:flutter/material.dart';

import '../../../../resource/resource.dart';
import '../../../../resource/src/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonName, required this.onTap}) : super(key: key);
  final String buttonName;
  final Function()  onTap;

  @override
  Widget build(BuildContext context) {
    ///
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ///
    return ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
        primary: AppColors.enabledButtonColor,
        minimumSize: Size(width - 40, height * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(height * 0.07),
            right: Radius.circular(height * 0.07),
          ),
        ),
      ),
      child: Text(
        buttonName,
        style: AppTextStyle.buttonTextStyle,
      ),
    );
  }
}
