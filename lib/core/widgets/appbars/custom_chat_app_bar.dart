import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChatAppBar({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
                size: 30.r,
              ),
            ),
          ),
          title: Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: CachedNetworkImageProvider(
                  image,
                ),
              ),
              Text(
                title,
                style: AppStyles.roboto24SemiBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xff808080).withValues(alpha: 0.50),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
