import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 370,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/toy.png',
              height: 80,
              width: 150,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 150,
            padding: EdgeInsetsDirectional.all(8),
            child: Column(
              children: [
                Text(
                  "Baby car",
                  style: AppStyles.roboto20SemiBold.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                Text(
                  "Brand: Goli",
                  style: AppStyles.roboto14Regular.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                Text(
                  "\$16.99",
                  style: AppStyles.roboto18Regular.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color.fromARGB(255, 242, 241, 241),
              border: Border.all(color: AppColors.primaryColor, width: 1.0),
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.darkBlueColor,
                ),
                Text(
                  "1",
                  style: AppStyles.roboto20SemiBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.remove,
                  color: AppColors.darkBlueColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
