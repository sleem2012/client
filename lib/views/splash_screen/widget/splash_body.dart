import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/new_bg_img.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key, required this.animation}) : super(key: key);
    final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: animation,
                builder: (_, __) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(animation.value * 2 * (22 / 7)),
                    alignment: Alignment.center,
                    child: __,
                  );
                },
                child: SvgPicture.asset('assets/images/Logo Only.svg'),
              ),
              Text(
                'Forall',
                style: KTextStyle.of(context).headers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
