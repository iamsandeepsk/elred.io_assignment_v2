import 'dart:io';

import 'package:elredio_assignment_2/resource/resource.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:elredio_assignment_2/utils/src/get_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageBottomSheet {
  static Future<File?> showPicker(context) async {
    return await showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (BuildContext bc) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///
              CustomPhotoSelectionWidget(
                onTap: () async {
                  ///
                  File? file = await ImageUtils.getImage(
                    imageSource: ImageSource.camera,
                  );

                  ///
                  if (file != null) {
                    ///
                    var tempFile =
                        await ImageUtils.cropImage(filePath: file.path);

                    ///
                    if (tempFile != null) {
                      file = tempFile;
                    }
                  }

                  ///
                  Navigator.of(context).pop(file);
                },
                icon: Icons.photo_camera,
                title: AppStrings.camera,
              ),

              ///
              CustomPhotoSelectionWidget(
                onTap: () async {
                  ///
                  File? file = await ImageUtils.getImage(
                    imageSource: ImageSource.gallery,
                  );

                  ///
                  if (file != null) {
                    ///
                    var tempFile =
                        await ImageUtils.cropImage(filePath: file.path);

                    ///
                    if (tempFile != null) {
                      file = tempFile;
                    }
                  }

                  ///
                  Navigator.of(context).pop(file);
                },
                icon: Icons.photo_rounded,
                title: AppStrings.gallery,
              ),
            ],
          );
        });
  }
}

class CustomPhotoSelectionWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const CustomPhotoSelectionWidget(
      {Key? key, required this.onTap, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 25.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.roundedCircleBorder,
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.red,
              ),
            ),

            ///
            Text(
              title,
              style: AppTextStyle.cameraGalleryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
