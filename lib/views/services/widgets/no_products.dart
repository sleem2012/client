// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/theme/colors.dart';

class KNoProductsView extends StatelessWidget {
  const KNoProductsView({
    Key? key,
    this.isCategory = false,
  }) : super(key: key);
  final bool isCategory;
// final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/images/no_products.svg', height: 120, color: KColors.accentColorD),
    );
  }
}
