import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/features/home/presentation/cubits/gallrey_cubit/gallrey_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/gallery_grid_items.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});
  static const String routeName = 'gallery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.gallery),
      body: BlocProvider(
        create: (context) => injector<GallreyCubit>()..getGallreyImages(),
        child: SafeArea(
          child: GalleryGridItems(),
        ),
      ),
    );
  }
}
