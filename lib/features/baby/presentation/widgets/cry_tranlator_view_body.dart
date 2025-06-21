import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/baby/presentation/view/baby_result_view.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/functions/show_error_message.dart';
import '../../../../core/functions/show_loading_box.dart';
import '../../../../core/helpers/record_helper.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../cubit/cry_translator_cubit/cry_translator_cubit.dart';
import 'custom_rounded_app_bar.dart';

class CryTranslatorViewBody extends StatefulWidget {
  const CryTranslatorViewBody({super.key});

  @override
  State<CryTranslatorViewBody> createState() => _CryTranslatorViewBodyState();
}

class _CryTranslatorViewBodyState extends State<CryTranslatorViewBody> {
  late RecordHelper _recordHelper;
  String status = AppStrings.startButton;
  @override
  void initState() {
    super.initState();
    _recordHelper = RecordHelper();
    _initializeRecorder();
  }

  @override
  void dispose() {
    _recordHelper.dispose();
    super.dispose();
  }

  Future<void> _initializeRecorder() async {
    await _recordHelper.initialize();
  }

  Future<void> _startRecording() async {
    if (await _recordHelper.startRecording()) {
      log('Recording started');
    } else {
      log('Recording failed');
    }
  }

  Future<void> _stopRecording() async {
    final path = await _recordHelper.stopRecording();
    if (path != null) {
      _uploadRecording(path);
    }
  }

  Future<void> _uploadRecording(String path) async {
    context.read<CryTranslatorCubit>().detectAudio(path);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomRoundedAppBar(
            title: AppStrings.cryTranslation,
          ),
          VerticalSpace(50),
          Text(
            AppStrings.translateYourBabysCry,
            style: AppStyles.roboto32Bold.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Image.asset(
            AppImages.babyCry,
            height: context.height * 0.60,
            width: context.width,
            fit: BoxFit.cover,
          ),
          VerticalSpace(16),
          BlocConsumer<CryTranslatorCubit, CryTranslatorState>(
            listener: (context, state) {
              if (state is CryTranslatorSuccess) {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  BabyResultView.routeName,
                  arguments: state.cryModel,
                );
              }

              if (state is CryTranslatorLoading) {
                showLoadingBox(context);
              }

              if (state is CryTranslatorError) {
                Navigator.pop(context);
                showErrorMessage(context, errMessage: state.errMessage);
              }
            },
            builder: (context, state) {
              return DefaultAppButton(
                text: status,
                onPressed: () {
                  if (_recordHelper.isRecording()) {
                    _stopRecording();
                    status = AppStrings.startButton;
                    setState(() {});
                  } else {
                    _startRecording();
                    status = AppStrings.stopRecording;
                    setState(() {});
                  }
                },
                backgroundColor: AppColors.secondaryColor,
                textColor: AppColors.primaryColor,
              );
            },
          ),
          VerticalSpace(50),
        ],
      ).withHorizontalPadding(8),
    );
  }
}
