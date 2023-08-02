// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../packages/extensions.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import 'appbar.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: title),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(KHelper.hPadding),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/soon.svg',
                color: KColors.of(context).accentColor,
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
      ),
    );
  }
}
