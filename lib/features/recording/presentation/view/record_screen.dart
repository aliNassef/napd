import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';
import '../../../../core/widgets/spacers.dart';
import '../widget/action_buttons.dart';
import '../widget/record_timer.dart';
import '../widget/record_title.dart';

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
                RecordTitle(),
                //timer
                RecordTimer(),
                VerticalSpace(140),
                Image.asset(
                  "assets/images/Vector.png",
                ),

                // Waveform Widget
                // RecordingWaveform(),
                VerticalSpace(30),
                // Action Buttons (Record, Pause, Stop)
                ActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
