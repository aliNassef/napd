import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/CustomRoundedAppBar.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';

class CryTranslatorScreen extends StatelessWidget {
  static const String routeName = '/babyCry';

  const CryTranslatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Custom AppBar
                CustomRoundedAppBar(
                  title: 'Cry Translator',
                ),

                VerticalSpace(50),

                // Subtitle
                Text(
                  "Translate your baby's cry",
                  style: AppStyles.textStyle26B.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),

                //VerticalSpace(8),

                // Baby illustration
                Image.asset(
                  "assets/images/baby_cry.png",
                  height: 490,
                  width: 500,
                ),

                // VerticalSpace(8),

                // Start Button
                DefaultAppButton(
                  text: "Start",
                  onPressed: () {},
                  backgroundColor: AppColors.secondaryColor,
                  textColor: AppColors.primaryColor,
                  padding: 52,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
