import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/services/category_model.dart';
import '../../packages/extensions.dart';
import '../../logic/products/product_system_bloc/products_bloc.dart';
import '../../logic/products/product_system_bloc/products_state.dart';
import 'sub_cat_cerc_list.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';
import '../../views/services/products/products_view.dart';

class SubCatChildTabs extends StatefulWidget {
  const SubCatChildTabs({super.key, required this.supCatChild});
  final CategoryModel supCatChild;
  @override
  State<SubCatChildTabs> createState() => _SubCatChildTabsState();
}

class _SubCatChildTabsState extends State<SubCatChildTabs> with SingleTickerProviderStateMixin {
  late final AnimationController aniCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
  late Animation<double> sizeAnimation = Tween<double>(begin: 1.25, end: 1.0).animate(CurvedAnimation(parent: aniCtrl, curve: Curves.easeOutBack));
  late Animation<double> opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: aniCtrl, curve: Curves.slowMiddle));

  @override
  initState() {
    super.initState();
    aniCtrl.forward();
  }

  @override
  dispose() {
    aniCtrl.dispose();
    super.dispose();
  }

  get toggleAnimation {
    !aniCtrl.isCompleted
        ? aniCtrl.forward()
        : {
            aniCtrl
              ..reset()
              ..forward()
          };
  }

  final tapIconRad = 15.0;

  onSelected(CategoryModel? sub) {
    GetProductsBloc.of(context).add(GetProductsEvents.get(isMore: false, sub: sub));
    toggleAnimation;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: widget.supCatChild.children?.length ?? 0,
        child: BlocBuilder<GetProductsBloc, GetProductsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25,
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: KColors.of(context).selectedCats,
                    indicatorWeight: .5,
                    labelStyle: KTextStyle.of(context).body.B,
                    unselectedLabelStyle: KTextStyle.of(context).hint.copyWith(fontSize: 14),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    onTap: (i) {
                      onSelected(widget.supCatChild.children?[i]);
                    },
                    tabs: widget.supCatChild.children?.map(
                          (e) {
                            final selectedCat = GetProductsBloc.of(context).selectedCat;
                            return Tab(
                              child: Text(
                                (e.name ?? 'Sup Cat').capitalized,
                                style: e == selectedCat ? KTextStyle.of(context).body.B : KTextStyle.of(context).hint
                                  ..copyWith(fontSize: 14),
                              ),
                            );
                          },
                        ).toList() ??
                        [],
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 60),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: (widget.supCatChild.children ?? []).map(
                            (e) {
                              return SupCatCercList(supCatChild: e, onSelected: onSelected);
                            },
                          ).toList(),
                        ),
                      ),
                      Expanded(
                        child: AnimatedBuilder(
                          animation: sizeAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: opacityAnimation.value,
                              child: Transform.scale(scale: sizeAnimation.value, child: child),
                            );
                          },
                          child: const ProductsView(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
