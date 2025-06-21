import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/background_widget.dart';
import '../cubit/cry_translator_cubit/cry_translator_cubit.dart';
import '../widgets/cry_tranlator_view_body.dart';

class CryTranslatorView extends StatelessWidget {
  const CryTranslatorView({super.key});
  static const String routeName = 'babyCry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: BlocProvider(
            create: (context) => injector<CryTranslatorCubit>(),
            child: CryTranslatorViewBody(),
          ),
        ),
      ),
    );
  }
}
