import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/services/category_model.dart';
import '../../packages/extensions.dart';
import '../../logic/products/product_system_bloc/products_bloc.dart';
import '../../logic/products/product_system_bloc/products_state.dart';
import '../../packages/widgets/image_widget.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';

class SupCatCercList extends StatelessWidget {
  const SupCatCercList({Key? key, required this.supCatChild, required this.onSelected}) : super(key: key);
  final CategoryModel supCatChild;
  final Function(CategoryModel sup) onSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
          itemBuilder: (c, i) => GestureDetector(
            onTap: () {
              onSelected.call(supCatChild.children![i]);
            },
            child: SubCatCercItem(supCatChild: supCatChild.children![i]),
          ),
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemCount: supCatChild.children?.length ?? 0,
        );
      },
    );
  }
}

class SubCatCercItem extends StatelessWidget {
  const SubCatCercItem({Key? key, required this.supCatChild}) : super(key: key);
  final CategoryModel supCatChild;

  @override
  Widget build(BuildContext context) {
    final bloc = GetProductsBloc.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
      constraints: BoxConstraints(maxWidth: bloc.selectedCat == supCatChild ? 120 : 55),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: KHelper.of(context).outlineCircleSelected(bloc.selectedCat == supCatChild),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: KImageWidget(
                    imageUrl: supCatChild.icons ?? dummyNetLogo,
                    height: 50,
                    color: bloc.selectedCat == supCatChild ? KColors.of(context).selectedCats : KColors.of(context).unSelectedCats,
                    placeHolder: Container(decoration: KHelper.of(context).shimmerCircle, width: 50, height: 50),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              (supCatChild.name ?? 'Sup Cat').capitalized,
              style: (bloc.selectedCat == supCatChild ? KTextStyle.of(context).body2 : KTextStyle.of(context).hint).copyWith(fontSize: 9, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
