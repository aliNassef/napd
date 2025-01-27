import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/widgets/CustomRoundedAppBar.dart';

class CryTranslatorAppBar extends StatelessWidget {
  const CryTranslatorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedAppBar(
      title: "cry translator title".tr(),
    );
  }
}
