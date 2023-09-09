import 'package:elredio_assignment_2/features/artist/view/artist_view.dart';
import 'package:elredio_assignment_2/features/change_design/view/widget/custom_button.dart';
import 'package:elredio_assignment_2/features/change_design/view_model/change_design_view_model.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resource/resource.dart';

class UploadPicture extends StatelessWidget {
  const UploadPicture({Key? key}) : super(key: key);

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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          ),
        ),
        title: Text(
          AppStrings.uploadPicture,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///
          Consumer<ChangeDesignViewModel>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                height: height * 0.7,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(
                    value.getProfileImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          ///
          Text(
            AppStrings.profileReady,
            style: AppTextStyle.blackTextStyle,
          ),

          ///
          const Spacer(),

          ///BUTTON
          CustomButton(
            buttonName: AppStrings.saveAndContinue,
            onTap: () async {
              ///
              var result = await changeDesignViewModel.uploadProfilePicture();

              ///
              if (result == true) {
                ///
                callNextPage(
                  context: context,
                );
              }
            },
          ),

          ///
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  callNextPage({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const ArtistView();
      },
    ));
  }
}
