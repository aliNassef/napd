import 'package:flutter/material.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/add_baby/presentation/widget/add_baby_title.dart';
import 'package:napd/features/add_baby/presentation/widget/add_button.dart';
import '../../../../core/widgets/background_widget.dart';
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
                  AddBabyTitle(),
                  const VerticalSpace(30),
                  const BabyImage(),
                  const VerticalSpace(55),
                  AddButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
