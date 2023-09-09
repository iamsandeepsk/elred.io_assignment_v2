import 'dart:io';

import 'package:elredio_assignment_2/features/change_design/view/upload_picture.dart';
import 'package:elredio_assignment_2/features/change_design/view/widget/upload_picture_button.dart';
import 'package:elredio_assignment_2/features/change_design/view_model/change_design_view_model.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resource/resource.dart';
import '../../../utils/utils.dart';

class ChangeDesign extends StatelessWidget {
  const ChangeDesign({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    ///
    final changeDesignViewModel = Provider.of<ChangeDesignViewModel>(
      context,
      listen: false,
    );
    ///
    final height = MediaQuery.of(context).size.height;

    ///
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        title: Text(
          AppStrings.changeDesign,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          ///
          UploadPictureButton(
            hMargin: 20.0,
            vMargin: 20.0,
            height: height*0.1,
            title: AppStrings.uploadPicture,
            onTap: () async {
              ///
              File? file = await ChooseImageBottomSheet.showPicker(context);

              ///
              if (file != null) {
                ///
                changeDesignViewModel.setProfileImage = file;

                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    ///
                    navigateToNextPage(context);
                  },
                );
              }
            },
          ),

          ///
          // Expanded(
          //   child: Consumer<ChangeDesignViewModel>(
          //     builder: (context, value, child) {
          //       return Container(
          //         margin: const EdgeInsets.all(20.0),
          //         child: value.getProfileImage == null
          //             ? const SizedBox()
          //             : ClipRRect(
          //                 borderRadius: BorderRadius.circular(20.0),
          //                 clipBehavior: Clip.antiAlias,
          //                 child: Image.file(
          //                   value.getProfileImage,
          //                 ),
          //               ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  ///
  navigateToNextPage(BuildContext context) {
    ///
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const UploadPicture();
      },
    ));
  }
}
