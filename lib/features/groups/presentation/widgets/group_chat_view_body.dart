import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/message_bubble.dart';

class GroupChatViewBody extends StatelessWidget {
  const GroupChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: 5,
            itemBuilder: (_, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CustomNetworkImage(
                      height: 45.h,
                      width: 45.w,
                      img:
                          'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
                    ),
                  ),
                  MessageBubble(
                    text: 'Ali Nassef',
                  ),
                ],
              );
            },
          ),
        ),
        VerticalSpace(16),
        // InputMessageField(
        //   isgroup: true,
        // ),
        VerticalSpace(16),
      ],
    ).withHorizontalPadding(16);
  }
}
