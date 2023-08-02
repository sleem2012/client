import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';

class ProductColors extends StatefulWidget {
  const ProductColors({Key? key}) : super(key: key);

  @override
  State<ProductColors> createState() => _ProductColorsState();
}

class _ProductColorsState extends State<ProductColors> {
  int? index;
  int? secondIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ProductDetailsBloc.of(context).sellectedColor != null) ...[
                Text(Tr.get.colors_available, style: KTextStyle.of(context).title4.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                SizedBox(
                  height: 25,
                  child: ListView.separated(
                    separatorBuilder: (context, i) => const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductDetailsBloc.of(context).allAvailableColors.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            index = i;
                          });
                          ProductDetailsBloc.of(context).onColorSelected(i);
                        },
                        child: Container(
                          // padding: EdgeInsets.,
                          decoration: index == i ? KHelper.of(context).selectedBox : KHelper.of(context).outSelectedBox,
                          child: SizedBox(
                            width: 60,
                            child: Center(
                                child: Text(
                              (ProductDetailsBloc.of(context).allAvailableColors[i]?.name?.value ?? ''),
                              maxLines: 1,
                            )

                                ///  KImageWidget(
                                ///   ProductDetailsBloc.of(context).allAvailableColors[i]?.icon ?? '',
                                ///   fit: BoxFit.cover,
                                /// ),
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
              if (ProductDetailsBloc.of(context).sellectedSize != null) ...[
                Text(Tr.get.sizes_available, style: KTextStyle.of(context).title4.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                SizedBox(
                  height: 25,
                  child: ListView.separated(
                    separatorBuilder: (context, i) => const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductDetailsBloc.of(context).allAvailableSizes.length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        setState(() {
                          secondIndex = i;
                        });
                        ProductDetailsBloc.of(context).onSizeSelected(i);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                        decoration: secondIndex == i ? KHelper.of(context).selectedBox : KHelper.of(context).outSelectedBox,
                        child: Center(
                          child: Text(
                            ProductDetailsBloc.of(context).allAvailableSizes[i]?.name?.value ?? '',
                          ),
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
