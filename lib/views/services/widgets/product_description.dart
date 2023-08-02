import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return
          Container(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 10),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Tr.get.description, style: KTextStyle.of(context).title4.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: null,
                child: Text(
                  ProductDetailsBloc.of(context).description,
                  // 'asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd',
                  style: KTextStyle.of(context).body,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
