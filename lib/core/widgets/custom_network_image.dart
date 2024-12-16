import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key, required this.img, this.width, this.height});
  final String img;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      
      width: width,
      height: height,
      imageUrl: img,
      fit: BoxFit.fill,
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      placeholder: (_, __) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
