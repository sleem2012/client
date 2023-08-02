// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../packages/extensions.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.list, required this.child, this.imagePath, required this.title, }) : super(key: key);
  final List list;
  final Widget child;
  final String? imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ?Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SvgPicture.asset(imagePath ?? 'assets/images/no_products.svg', color: KColors.accentColorD, height: 120),
                      20.h,
                      Text(
                        title,
                        style: KTextStyle.of(context).black_grey_bold.S(1.8),
                      )
                    ],
                  ),
                ),
              )
        : child;
  }
}
