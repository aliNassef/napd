import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:napd/core/helpers/firebase_auth_service.dart';
import '../extensions/padding_extension.dart';
import '../functions/toast_dialog.dart';
import '../utils/app_images.dart';
import 'social_media_item.dart';

class SocialMediaListItems extends StatelessWidget {
  const SocialMediaListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaItem(
          img: AppSvgs.faceIcon,
          onTap: () async {
            final authService = FirebaseAuthService();
            await authService.signInWithFacebook().then((value) {
              log('done');
              showToast(text: 'done');
            }).catchError((error) {
              log(error.toString());
              showToast(text: 'error$error');
            });
          },
        ),
        SocialMediaItem(
          img: AppSvgs.googleIcon,
          onTap: () async {
            final authService = FirebaseAuthService();
            await authService.signInWithGoogle().then((value) {
              showToast(text: 'done');
            }).catchError((error) {
              log(error.toString());
              showToast(text: 'error$error');
            });
          },
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
