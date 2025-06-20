import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/features/groups/data/model/article_model.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CustomNetworkImage(
            img: article.imageUrl,
            height: 133.h,
            width: 166.w,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Color(0xff5C6898).withValues(alpha: 0.6),
            ),
            child: Text(
              article.title,
              style: AppStyles.roboto14Regular.copyWith(
                color: Color(0xfff5f5f5),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
