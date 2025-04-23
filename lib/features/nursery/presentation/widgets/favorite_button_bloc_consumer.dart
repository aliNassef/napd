
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/functions/show_error_message.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/hospital_model.dart';
import '../cubit/nursing_cubit.dart';
import '../cubit/nursing_state.dart';

class FavoriteButtonBlocConsumer extends StatelessWidget {
  const FavoriteButtonBlocConsumer({
    super.key,
    required this.hospital,
  });

  final HospitalModel hospital;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NursingCubit, NursingState>(
        listener: (context, state) {
          if (state is ToggleFavoriteFailure) {
            showErrorMessage(
              context,
              errMessage: state.errMessage,
            );
          }
          if (state is ToggleFavoriteLoaded) {
            if (state.id == hospital.id) {
              hospital.isFavourite = !hospital.isFavourite!;
            }
          }
        },
        buildWhen: (previous, current) =>
            current is ToggleFavoriteLoaded ||
            current is ToggleFavoriteLoading ||
            current is ToggleFavoriteFailure,
        builder: (context, state) {
          if (state is ToggleFavoriteLoading &&
              state.id == hospital.id) {
            return Center(
                child: const CircularProgressIndicator());
          }
    
          return IconButton(
            alignment: Alignment.center,
            onPressed: () {
              final cubit = context.read<NursingCubit>();
              hospital.isFavourite!
                  ? cubit.delHospitalFromFav(hospital.id!)
                  : cubit.addHospitalToFav(hospital.id!);
            },
            icon: hospital.isFavourite!
                ? SvgPicture.asset(AppSvgs.favIcon)
                : SvgPicture.asset(AppSvgs.unFavIcon),
          );
        });
  }
}
