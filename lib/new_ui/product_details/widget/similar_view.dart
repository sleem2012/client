import 'package:flutter/material.dart';
import '../../../packages/extensions.dart';
import '../logic/details_cubit.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/image_widget.dart';

class SimilarView extends StatelessWidget {
  const SimilarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = DetailsCubit.of(context);
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final similar = details.getSimilar?[index];
          return InkWell(
            onTap: () {
              if ((similar?.products ?? []).isEmpty) {
                KHelper.showSnackBar(Tr.get.no_products);
              } else {
                DetailsCubit.of(context).setProductSystem(
                  model: similar!,
                  similar: details.getSimilar ?? [],
                );
              }
            },
            child: Column(children: [
              KImageWidget(
                imageUrl: similar?.products?.firstOrNull?.imageValues?.firstOrNull?.s512px ?? dummyNetLogo,
                height: 180,
                width: 150,
                fit: BoxFit.cover,
              ),
              5.h,
              Text(
                similar?.name?.value ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  children: [
                    Text(similar?.products?.firstOrNull?.price ?? '', style: KTextStyle.of(context).title5),
                    const SizedBox(width: 5),
                    // if (details.selectedProductMenu?.has_offer ?? false)
                    Text(similar?.products?.firstOrNull?.discount ?? '', style: KTextStyle.of(context).lineThrough.copyWith(fontSize: 10))
                  ],
                ),
              )
            ]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: details.getSimilar?.length ?? 0,
      ),
    );
  }
}
