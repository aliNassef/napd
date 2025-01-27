import 'package:flutter/material.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/cry_translator/presentation/widget/cry_translation_image.dart';
import 'package:napd/features/cry_translator/presentation/widget/cry_translator_appBar.dart';
import 'package:napd/features/cry_translator/presentation/widget/cry_translator_button.dart';
import 'package:napd/features/cry_translator/presentation/widget/cry_translator_subtitle.dart';

class CryTranslatorContent extends StatelessWidget {
  const CryTranslatorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CryTranslatorAppBar(),
        VerticalSpace(50),
        CryTranslatorSubtitle(),
        CryTranslatorImage(),
        CryTranslatorStartButton(),
      ],
    );
  }
}
