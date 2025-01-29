import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';
import '../widgets/cry_tranlator_view_body.dart';

class CryTranslatorView extends StatelessWidget {
  const CryTranslatorView({super.key});
  static const String routeName = 'babyCry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: CryTranslatorViewBody(),
        ),
      ),
    );
  }
}
