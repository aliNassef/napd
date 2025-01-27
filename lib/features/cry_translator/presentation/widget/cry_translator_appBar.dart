import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class CryTranslatorAppBar extends StatelessWidget {
  const CryTranslatorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedAppBar(
      title: "cry translator title".tr(),
    );
  }
}
