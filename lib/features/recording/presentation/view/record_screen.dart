import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/core/widgets/spacers.dart';

class RecordScreen extends StatelessWidget {
  static const String routeName = '/recording';
  const RecordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title: "Record"
                Text(
                  'Record',
                  style: AppStyles.textStyle40B.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                VerticalSpace(50),
                // Timer
                Text(
                  '00:50', // Static timer for now
                  style: AppStyles.textStyle36SB.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
                VerticalSpace(140),
                Image.asset(
                  "assets/images/Vector.png",
                ),

                // Waveform Widget
                // RecordingWaveform(),

                VerticalSpace(30),
                // Action Buttons (Record, Pause, Stop)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Record Button
                    IconButton(
                      icon: Icon(
                        Icons.fiber_smart_record_outlined,
                        color: AppColors.secondaryColor,
                        size: 55,
                      ),
                      onPressed: () {}, // Add functionality later
                    ),
                    HorizantalSpace(30),
                    // Pause Button
                    IconButton(
                      icon: Icon(
                        Icons.pause_circle_outline_outlined,
                        color: AppColors.secondaryColor,
                        size: 60,
                      ),
                      onPressed: () {}, // Add functionality later
                    ),
                    HorizantalSpace(30),
                    // Stop Button
                    IconButton(
                      icon: Icon(
                        Icons.stop_circle_outlined,
                        color: AppColors.greyColor,
                        size: 55,
                      ),
                      onPressed: () {}, // Add functionality later
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
