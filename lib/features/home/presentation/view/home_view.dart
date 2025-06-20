import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import 'package:napd/features/baby/presentation/cubit/get_baby_cubit/get_baby_cubit.dart';
import '../../../../core/di/service_locator.dart';
import '../cubits/gallrey_cubit/gallrey_cubit.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              injector<GetMotherProfileCubit>()..getMotherProfile(),
        ),
        BlocProvider(
          create: (context) => injector<GetBabyCubit>()..getBaby(),
        ),
        BlocProvider(
          create: (context) => injector<GallreyCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: HomeAppBar(),
        drawer: CustomDrawer(),
        body: HomeViewBody(),
      ),
    );
  }
}
