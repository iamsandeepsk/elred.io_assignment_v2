import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:elredio_assignment_2/resource/resource.dart';
import 'package:elredio_assignment_2/service/response/api_response.dart';
import 'package:elredio_assignment_2/service/response/api_status.dart';
import 'package:elredio_assignment_2/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart' as http_parser;

import '../model/upload_profile_model.dart';
import '../repo/change_design_repository.dart';

class ChangeDesignViewModel extends ChangeNotifier {
  ///
  final ChangeDesignRepository _changeDesignRepository =
      ChangeDesignRepository();

  /// PROFILE IMAGE
  File? _profileImage;

  /// SET PROFILE IMAGE
  set setProfileImage(File file) {
    _profileImage = file;
    notifyListeners();
  }

  /// GET PROFILE IMAGE
  File? get getProfileImage {
    return _profileImage;
  }

  ///
  ApiResponse<UploadProfileModel> uploadProfileResponse = ApiResponse.loading();

  ///
  Future<bool?> uploadProfilePicture(
      {bool? isFromCustomizeScreen = false, Uint8List? uint8list}) async {
    ///
    MultipartFile? multipartFile;

    ///
    if (isFromCustomizeScreen == true) {
      ///
      multipartFile = MultipartFile.fromBytes(
        uint8list!,
        filename: 'photo',
        contentType: http_parser.MediaType("image", "jpg"),
      );
    } else if (_profileImage != null) {
      var byteData = _profileImage?.readAsBytesSync();

      ///
      multipartFile = MultipartFile.fromBytes(
        byteData!,
        filename: 'photo',
        contentType: http_parser.MediaType("image", "jpg"),
      );
    }

    ///
    // multipartFile = await MultipartFile.fromFile(
    //   _profileImage!.path,
    //   filename: "user.jpg",
    //   contentType: http_parser.MediaType("image", "png"),
    // );

    ///SHOW LOADING
    DialogUtils.showLoadingDialog();

    // await Future.delayed(Duration(seconds: 3));

    ///
    await _changeDesignRepository
        .uploadProfilePicture(
      file: multipartFile!,
    )
        .then((value) {
      uploadProfileResponse = ApiResponse.completed(value);
    }).onError((error, stackTrace) {
      ///
      log("In ON ERROR: $error");

      ///
      uploadProfileResponse = ApiResponse.error(
        error.toString(),
      );
    });

    /// HIDE LOADING
    DialogUtils.closeDialog();

    ///
    if (uploadProfileResponse.status == Status.completed) {
      if (isFromCustomizeScreen == false) {
        ///
        DialogUtils.showMessage(
          message: AppStrings.profileImageUploadedSuccess,
        );
      }
      return true;
    } else if (uploadProfileResponse.status == Status.error) {
      ///
      DialogUtils.showMessage(
        message: uploadProfileResponse.message ?? "",
      );
      return false;
    }
    return null;
  }
}
