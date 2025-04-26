import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.img,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
  });
  final String img;
  final double? width;
  final double? height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: EndPoints.baseUrl + img,
      fit: fit,
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      placeholder: (_, __) => Skeletonizer(
        enabled: true,
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
