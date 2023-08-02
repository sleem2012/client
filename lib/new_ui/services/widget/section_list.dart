import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/vendor_details_cubit.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import 'menu_list.dart';

class SectionList extends StatefulWidget {
  const SectionList({
    Key? key,
    required this.onTap,
    required this.products,
  }) : super(key: key);
  final void Function(int index) onTap;
  final List<ProductTags> products;

  @override
  State<SectionList> createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> with SingleTickerProviderStateMixin {
  ProductTags? product;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.products.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionTabsCubit, VendorDetailsState>(
      builder: (context, state) {
        final selected = SectionTabsCubit.of(context).selected;
        product = widget.products[selected ?? 0];
        return SizedBox(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: KColors.of(context).selectedCats,
                    indicatorWeight: .5,
                    onTap: (i) {
                      setState(() {
                        product = widget.products[i];
                      });
                      widget.onTap.call(i);
                    },
                    tabs: widget.products.map(
                      (e) {
                        return Container(
                          decoration: BoxDecoration(
                            color: e == product ? KColors.of(context).accentColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: KColors.of(context).accentColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Center(
                              child: Text(
                                (e.name),
                                maxLines: 1,
                                style: KTextStyle.of(context)
                                    .boldTitle1
                                    .copyWith(fontSize: 14, color: e == product ? Colors.white : KColors.of(context).accentColor),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList()),
              ),
            ],
          ),
        );
      },
    );
  }
}
