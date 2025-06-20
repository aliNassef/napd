import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/baby/presentation/cubit/get_baby_cubit/get_baby_cubit.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/baby_profile_view_body.dart';

class BabyProfileView extends StatelessWidget {
  const BabyProfileView({super.key});
  static const String routeName = 'babyProfileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Baby Profile'),
      body: BlocProvider(
        create: (context) => injector<GetBabyCubit>()..getBaby(),
        child: BabyProfileViewBody(),
      ),
    );
  }
}
