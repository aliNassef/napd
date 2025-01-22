import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/background_widget.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../widget/baby_image.dart';

class AddBabyPage extends StatelessWidget {
  static const String routeName = '/addBaby';
  const AddBabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add your baby",
                    style: AppStyles.textStyle48B.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const VerticalSpace(30),
                  const BabyImage(),
                  const VerticalSpace(55),
                  DefaultAppButton(
                    text: "Add",
                    onPressed: () {},
                    backgroundColor: AppColors.secondaryColor,
                    textColor: AppColors.primaryColor,
                    padding: 48,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
