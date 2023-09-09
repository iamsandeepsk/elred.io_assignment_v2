import 'dart:developer';
import 'dart:io';

import 'package:elredio_assignment_2/resource/resource.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  /// TO GET AN IMAGE FROM GALLERY OR CAMERA
  static Future<File?> getImage({required ImageSource imageSource}) async {
    ///
    File? file;

    try {
      XFile? imageFile = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 85,
      );

      if (imageFile != null) {
        file = File(imageFile.path);
      }
    } catch (sd) {
      log("Exception Get Image $sd");
    }
    return file;
  }

  /// CROP IMAGE
  static Future<File?> cropImage({required String filePath}) async {
    ///
    File? file;

    ///
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Edit Photo',
            toolbarColor: AppColors.paleBlue,
            toolbarWidgetColor: AppColors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Edit Photo',
        ),
      ],
    );
    if (croppedFile != null) {
      file = File(croppedFile.path);
    }
    return file;
  }
}
