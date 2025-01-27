import 'package:flutter/material.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/features/cry_translator/presentation/widget/cry_translator_content.dart';

class CryTranslatorScreen extends StatelessWidget {
  static const String routeName = '/babyCry';

  const CryTranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Center(
            child: CryTranslatorContent(),
          ),
        ),
      ),
    );
  }
}
