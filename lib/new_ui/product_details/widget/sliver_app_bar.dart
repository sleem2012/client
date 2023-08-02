import 'package:flutter/material.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../../views/widgets/photo_viewer.dart';

import '../../../shared/theme/colors.dart';
import '../../../views/services/widgets/cart_icon_btn.dart';

class KSLiverAppbar extends StatelessWidget {
  const KSLiverAppbar({Key? key, required this.img, this.title}) : super(key: key);
  final String img;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      floating: true,
      backgroundColor: KColors.of(context).background,
      elevation: 2,
      expandedHeight: 310,
      title: title != null ? Text(title!) : null,
      actions: const [CartIconButton()],
      flexibleSpace: FlexibleSpaceBar(background: InkWell(onTap: () {
        Nav.to(KPhotoView(image: img));
      },child: KImageWidget( fit: BoxFit.cover, imageUrl: img,))),
    );
  }
}
