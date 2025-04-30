import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import '../../../../core/di/service_locator.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<GetMotherProfileCubit>()..getMotherProfile(),
      child: Scaffold(
        appBar: HomeAppBar(),
        drawer: CustomDrawer(),
        body: HomeViewBody(),
      ),
    );
  }
}
