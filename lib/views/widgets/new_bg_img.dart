import 'package:flutter/material.dart';

import '../../logic/theme/theme_cubit.dart';

class BgImg extends StatelessWidget {
  const BgImg({Key? key, this.child, this.isInputs, this.opacity, this.img , this.showImg = true}) : super(key: key);
  final Widget? child;
  final bool? isInputs;
  final bool? showImg;
  final double? opacity;
  final String? img;
  @override
  Widget build(BuildContext context) {
    /// final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        if(showImg!)
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: opacity ?? 1.0,
              image: AssetImage(
                img ?? 'assets/images/${isInputs == true ? "main_bg_" : "splash_"}${ThemeBloc.of(context).strTheme}.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: child,
        ),
      ],
    );
  }
}
