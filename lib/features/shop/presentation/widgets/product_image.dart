import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 255,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/images/toy.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
