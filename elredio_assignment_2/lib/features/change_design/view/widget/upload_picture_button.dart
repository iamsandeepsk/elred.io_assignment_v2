import 'package:flutter/material.dart';

import '../../../../resource/resource.dart';
import '../../../../resource/src/app_text_style.dart';
import 'start_widget.dart';

class UploadPictureButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double hMargin;
  final double vMargin;
  final String title;

  const UploadPictureButton(
      {Key? key,
      required this.onTap,
      required this.height,
      required this.hMargin,
      required this.vMargin,
      required this.title})
      : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      height: height,
      decoration: BoxDecoration(
        color: AppColors.paleBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ///
            const Star(
              top: 10.0,
              left: 30.0,
              iconSize: 20.0,
            ),

            ///
            const Star(
              top: 20.0,
              left: 45.0,
              iconSize: 10.0,
            ),

            ///
            const Star(
              bottom: 10.0,
              right: 30.0,
              iconSize: 20.0,
            ),

            ///
            const Star(
              bottom: 20.0,
              right: 45.0,
              iconSize: 10.0,
            ),

            ///
            Text(
              title,
              style: AppTextStyle.blueTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
