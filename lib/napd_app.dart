import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:napd/features/boarding/presentation/view/boarding_view.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/app_router.dart';

class Napd extends StatelessWidget {
  const Napd({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      enableScaleWH: () => false,
      enableScaleText: () => false,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Napd',
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: BoardingView.routeName,
      ),
    );
  }
}
