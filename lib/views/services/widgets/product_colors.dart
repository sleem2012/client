import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/image_widget.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: KHelper.hPadding, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: KHelper.of(context)
              .filled
              .copyWith(borderRadius: BorderRadius.circular(0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ProductDetailsBloc.of(context).sellectedColor != null) ...[
                Text(Tr.get.colors_available,
                    style: KTextStyle.of(context).title3),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, i) => const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductDetailsBloc.of(context)
                        .allAvailableColors
                        .length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        ProductDetailsBloc.of(context).onColorSelected(i);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: KColors.of(context).elevatedBox,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                            color:
                                ProductDetailsBloc.of(context).sellectedColor ==
                                        ProductDetailsBloc.of(context)
                                            .allAvailableColors[i]
                                    ? KColors.accentColorD
                                    : Colors.transparent,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                offset: const Offset(0, 3),
                                color: KColors.of(context).shadow)
                          ],
                        ),
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: KImageWidget(
                              imageUrl: ProductDetailsBloc.of(context)
                                      .allAvailableColors[i]
                                      ?.icon ??
                                  '',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              if (ProductDetailsBloc.of(context).sellectedSize != null) ...[
                Text(Tr.get.sizes_available,
                    style: KTextStyle.of(context).title3),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, i) => const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        ProductDetailsBloc.of(context).allAvailableSizes.length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        ProductDetailsBloc.of(context).onSizeSelected(i);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ProductDetailsBloc.of(context).sellectedSize ==
                                  ProductDetailsBloc.of(context)
                                      .allAvailableSizes[i]
                              ? KColors.of(context).freeShiping
                              : KColors.of(context).background,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          ProductDetailsBloc.of(context)
                                  .allAvailableSizes[i]
                                  ?.symbol ??
                              '',
                          style: KTextStyle.of(context)
                              .headers
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ]
            ],
          ),
        );
      },
    );
  }
}
