import 'package:flutter/material.dart';
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
                  const Text(
                    "Add your baby",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const BabyImage(),
                  const SizedBox(height: 55),
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
