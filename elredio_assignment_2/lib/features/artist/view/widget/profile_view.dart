import 'package:elredio_assignment_2/features/artist/view/artist_view.dart';
import 'package:elredio_assignment_2/resource/src/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../resource/resource.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  ///
  final List<Widget> listOfIcon = const [
    ///
    CustomTileWidget(
      icon: Icons.star_border,
    ),

    ///
    CustomTileWidget(
      icon: Icons.mail_rounded,
    ),

    ///
    CustomTileWidget(
      icon: Icons.call,
    ),

    ///
    CustomTileWidget(
      icon: Icons.location_on_rounded,
    ),

    ///
    CustomTileWidget(
      icon: Icons.lightbulb_circle_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ///
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ///
        Container(
          decoration: BoxDecoration(
            color: AppColors.paleBlack.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              12.0,
            ),
          ),
        ),

        ///
        Positioned.fill(
          top: height * 0.02,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                ///
                Container(
                  height: height * 0.2,
                  width: height * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(4.0),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          AssetPath.dummyProfileImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                ///
                Text(
                  AppStrings.alexadra,
                  style: AppTextStyle.bigWhiteTextStyle,
                ),

                ///
                Text(
                  AppStrings.stanton,
                  style: AppTextStyle.smallWhiteTextStyle,
                ),

                ///
                const SizedBox(
                  height: 20.0,
                ),

                ///
                Text(
                  AppStrings.realtor,
                  style: AppTextStyle.smallWhiteTextStyle,
                ),

                ///
                Text(
                  AppStrings.banglore,
                  style: AppTextStyle.smallWhiteTextStyle,
                ),

                ///
                const Spacer(),

                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///
                    ...listOfIcon
                  ],
                ),

                ///
                const SizedBox(
                  height: 20.0,
                ),

                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///
                    Text(
                      AppStrings.elRed,
                      style: AppTextStyle.smallWhiteTextStyle,
                    ),

                    ///
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: AppColors.paleBlack.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            color: AppColors.white,
                            size: 14.0,
                          ),
                        ),

                        ///
                        const SizedBox(
                          width: 4.0,
                        ),

                        ///
                        Text(
                          AppStrings.profile,
                          style: AppTextStyle.smallWhiteTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
