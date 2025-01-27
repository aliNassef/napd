import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';
import '../widget/cry_translator_content.dart';

class CryTranslatorView extends StatelessWidget {
  static const String routeName = '/babyCry';

  const CryTranslatorView({super.key});

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
