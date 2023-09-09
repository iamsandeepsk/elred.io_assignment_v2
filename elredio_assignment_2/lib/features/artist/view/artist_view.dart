import 'dart:developer';

import 'package:elredio_assignment_2/features/artist/view/customize_your_card_view.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:elredio_assignment_2/service/response/api_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resource/resource.dart';
import '../view_model/artist_view_model.dart';
import 'widget/custom_outlined_button.dart';
import 'widget/profile_view.dart';

class ArtistView extends StatefulWidget {
  const ArtistView({Key? key}) : super(key: key);

  @override
  State<ArtistView> createState() => _ArtistViewState();
}

class _ArtistViewState extends State<ArtistView> {
  ///
  late ArtistViewModel artistViewModel;

  @override
  void initState() {
    super.initState();

    ///
    artistViewModel = Provider.of<ArtistViewModel>(
      context,
      listen: false,
    );

    ///
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///
      artistViewModel.getBackgroundImage(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          AppStrings.artist,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          ///
          Consumer<ArtistViewModel>(builder: (context, value, child) {
            log("Consumer Parent Build ${value.backgroundImage.status}");

            ///
            switch (value.backgroundImage.status) {

              ///
              case Status.loading:

                ///
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              ///
              case Status.error:

                ///
                return Text(value.backgroundImage.toString());

              ///
              case Status.completed:
                ////
                return const CardWidget();

              ///
              default:

                ///
                return Text(
                  AppStrings.somethingWentWrong,
                  style: AppTextStyle.blackTextStyle,
                );
            }
          }),

          ///BUTTON
          CustomOutlinedButton(
            buttonName: AppStrings.editCard,
            onTap: () {
              callNextPage();
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

  ///
  Future<void> callNextPage() async {
    /// REMOVE PREVIUSLY SELECTED FILE
    artistViewModel.file = null;

    ///
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomizeYourCard(),
      ),
    );

    ///
    if (result == true) {
      log("Get Background New");

      ///
      artistViewModel.getBackgroundImage(context: context);
    }
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    final ArtistViewModel artistViewModel =
        Provider.of<ArtistViewModel>(context, listen: true);

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
              child: Image.network(
                artistViewModel.backgroundImage.data ?? "",
                fit: BoxFit.cover,
                height: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress != null
                      ? const Center(child: CupertinoActivityIndicator())
                      : child;
                },
              ),
            ),

            ///
            const ProfileView()
          ],
        ),
      ),
    );
  }
}

class CustomTileWidget extends StatelessWidget {
  final IconData icon;

  const CustomTileWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.paleBlack.withOpacity(0.6),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Icon(
        icon,
        color: AppColors.white,
      ),
    );
  }
}
