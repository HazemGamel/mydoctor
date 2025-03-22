

import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/assets.dart';

customAnimationLoading() {
  return Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            AppAssets.animationLoading,
            fit: BoxFit.cover,
          ),
        ),
      );
}