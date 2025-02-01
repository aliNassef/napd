import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/appbars/custom_search_app_bar.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/dialog_content_list.dart';
import '../widgets/nursery_view_body.dart';

class NurseryView extends StatelessWidget {
  const NurseryView({super.key});
  static const routeName = 'nursery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(
        leading: GestureDetector(
          onTap: () {
            _buildDialog(context);
          },
          child: SvgPicture.asset(AppSvgs.filterIcon),
        ),
      ),
      body: SafeArea(
        child: NurseryViewBody(),
      ),
    );
  }

  Future<dynamic> _buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.only(
            bottom: 10.h,
          ),
          titlePadding: EdgeInsets.symmetric(
            vertical: 35.h,
            horizontal: 20.w,
          ),
          backgroundColor: Colors.white,
          title: CustomSearchBar(),
          content: DialogContentList(),
        );
      },
    );
  }
}
