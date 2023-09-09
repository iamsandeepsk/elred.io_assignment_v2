import 'dart:developer';
import 'dart:io';

import 'package:elredio_assignment_2/features/change_design/view_model/change_design_view_model.dart';
import 'package:elredio_assignment_2/service/response/api_response.dart';
import 'package:elredio_assignment_2/service/response/api_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistViewModel extends ChangeNotifier {
  ///
  File? _file;

  ///
  File? get file => _file;

  ///
  set file(File? file) {
    _file = file;
    notifyListeners();
  }

  ///
  ApiResponse<String> backgroundImage = ApiResponse.initial();

  ///
  getBackgroundImage({required BuildContext context}) {
    ///
    backgroundImage = ApiResponse.loading();

    ///
    notifyListeners();

    log("Here 1 ");

    ///
    final ChangeDesignViewModel changeDesignViewModel =
        Provider.of<ChangeDesignViewModel>(context, listen: false);

    ///
    if (changeDesignViewModel.uploadProfileResponse.status ==
        Status.completed) {
      ///
      backgroundImage = ApiResponse.completed(
        changeDesignViewModel
            .uploadProfileResponse.data?.result[0].profileBannerImageUrl,
      );
    } else {
      ////
      backgroundImage = ApiResponse.error("No Background Image");
    }

    ///
    notifyListeners();
    log("Here 2");
  }
}
