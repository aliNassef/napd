import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import 'drawer_list_items.dart';
import 'drawer_top_bar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: context.width * 3 / 4,
      child: SafeArea(
        child: Column(
          spacing: 50.h,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DrawerTopBar(),
            Expanded(child: DrawerListItems()),
          ],
        ),
      ),
    );
  }
}
