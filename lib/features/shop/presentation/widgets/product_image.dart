import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 255,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
