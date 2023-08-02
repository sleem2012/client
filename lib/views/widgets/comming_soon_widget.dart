// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../packages/extensions.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KHelper.hPadding),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/soon.svg',
              color: KColors.accentColorD,
              height: 120,
            ),
            20.h,
            Text(
              Tr.get.stay_tuned,
              style: KTextStyle.of(context).black_grey_bold.S(1.8),
            ),
          ],
        ),
      ),
    );
  }
}
