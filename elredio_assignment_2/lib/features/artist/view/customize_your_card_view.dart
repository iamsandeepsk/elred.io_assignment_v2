import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:elredio_assignment_2/features/artist/view/widget/profile_view.dart';
import 'package:elredio_assignment_2/features/artist/view_model/artist_view_model.dart';
import 'package:elredio_assignment_2/features/change_design/view/widget/custom_button.dart';
import 'package:elredio_assignment_2/features/change_design/view/widget/upload_picture_button.dart';
import 'package:elredio_assignment_2/features/change_design/view_model/change_design_view_model.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../resource/resource.dart';
import '../../../utils/utils.dart';

class CustomizeYourCard extends StatelessWidget {
  const CustomizeYourCard({Key? key}) : super(key: key);

  ///
  static final TransformationController controller = TransformationController();

  ///TO CAPTURE WIDGET
  static final GlobalKey _repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ///
    final artistViewModel = Provider.of<ArtistViewModel>(
      context,
      listen: false,
    );

    ///
    final height = MediaQuery.of(context).size.height;

    ///
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context, false);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
            ),
          ),
          title: Text(
            AppStrings.customizeYourCard,
            style: AppTextStyle.appBarTextStyle,
          ),
        ),
        body: Column(
          children: [
            ///
            UploadPictureButton(
              height: height * 0.07,
              hMargin: 20.0,
              vMargin: 0.0,
              title: AppStrings.changePicture,
              onTap: () async {
                ///
                File? file = await ChooseImageBottomSheet.showPicker(context);

                ///
                if (file != null) {
                  ///
                  artistViewModel.file = file;
                }
              },
            ),

            ///
            Consumer<ArtistViewModel>(
              builder: (context, value, child) {
                ///
                final ArtistViewModel artistViewModel =
                    Provider.of<ArtistViewModel>(context, listen: false);

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ///
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: RepaintBoundary(
                            key: _repaintKey,
                            child: InteractiveViewer(
                              transformationController: controller,
                              scaleEnabled: true,
                              panEnabled: true,
                              onInteractionEnd: (ScaleEndDetails endDetails) {
                                // log("Details $endDetails");
                                // log("Velocity ${endDetails.velocity}");
                              },
                              child: artistViewModel.file == null
                                  ? Image.network(
                                      artistViewModel.backgroundImage.data ??
                                          "",
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                    )
                                  : Image.file(
                                      artistViewModel.file!,
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                            ),
                          ),
                        ),

                        ///
                        const IgnorePointer(
                          ignoring: true,
                          child: ProfileView(),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),

            ///BUTTON
            CustomButton(
              buttonName: AppStrings.save,
              onTap: () async {
                ///
                final ChangeDesignViewModel changeDesignViewModel =
                    Provider.of<ChangeDesignViewModel>(context, listen: false);

                ///
                var imageData = await convertWidgetToImage();

                ///
                if (imageData != null) {
                  ///
                  var result = await changeDesignViewModel.uploadProfilePicture(
                    isFromCustomizeScreen: true,
                    uint8list: imageData,
                  );
                  if (result == true) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ///
                      Navigator.pop(context, true);
                    });
                  }
                }
              },
            ),

            ///
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  /// TO CAPTURE THE WIDGET....
  Future<Uint8List?> convertWidgetToImage() async {
    ///
    DialogUtils.showLoadingDialog();

    ///
    Uint8List? uint8list;
    RenderRepaintBoundary renderRepaintBoundry = _repaintKey.currentContext!
        .findRenderObject()! as RenderRepaintBoundary;

    ui.Image boxImage =
        await renderRepaintBoundry.toImage(pixelRatio: 4); //pixRatio);

    ByteData? byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      uint8list = byteData.buffer.asUint8List();
    }

    ///
    DialogUtils.closeDialog();

    return uint8list;
  }
}
