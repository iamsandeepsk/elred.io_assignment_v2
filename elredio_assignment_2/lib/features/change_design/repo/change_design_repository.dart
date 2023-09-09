import 'package:dio/dio.dart';
import 'package:elredio_assignment_2/resource/resource.dart';

import '../../../service/remote/base_api_services.dart';
import '../../../service/remote/remote_api_services.dart';
import '../model/upload_profile_model.dart';

class ChangeDesignRepository {
  ///
  final BaseApiServices _networkApiServices = NetworkApiServices.getInstance;

  ///
  Future<UploadProfileModel?> uploadProfilePicture({
    required MultipartFile file,
  }) async {
    ///
    FormData formData = FormData();
    formData.files.add(MapEntry("profileBannerImageURL", file));

    ///
    try {
      var response = await _networkApiServices.postRequest(
        url: ApiEndpoint.postProfileImage,
        formData: formData,
        isFormData: true,
        isJson: false,
      );

      UploadProfileModel uploadProfileModel =
          UploadProfileModel.fromJson(response);

      return uploadProfileModel;
    } catch (sd) {
      rethrow;
    }
  }
}
