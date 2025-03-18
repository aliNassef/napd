import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/gallery_grid_items.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});
  static const String routeName = 'gallery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Gallery'),
      body: SafeArea(
        child: GalleryGridItems(),
      ),
    );
  }
}
