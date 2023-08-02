import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/details_cubit.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../product_details_entity.dart';

class SubSelectionList extends StatefulWidget {
  const SubSelectionList({
    Key? key,
  }) : super(key: key);

  @override
  State<SubSelectionList> createState() => _SubSelectionListState();
}

class _SubSelectionListState extends State<SubSelectionList> {
  @override
  Widget build(BuildContext context) {
    final date = DetailsCubit.of(context);
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return BlocSelector<DetailsCubit, DetailsState, ProductSelectable?>(
          selector: (state) => date.selectedSub,
          builder: (context, state) {
            return SizedBox(
              height: 25,
              child: ListView.separated(
                separatorBuilder: (context, i) => const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: date.selectedMain?.subSelection?.length ?? 0,
                itemBuilder: (context, i) {
                  final item = date.selectedMain?.subSelection?[i];
                  return InkWell(
                    onTap: () {
                      date.onSubSelect(item);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: date.selectedSub == item
                            ? KColors.of(context).accentColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: KColors.of(context).accentColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          item?.title ?? '',
                          style: KTextStyle.of(context).boldTitle1.copyWith(
                              color: date.selectedSub == item
                                  ? Colors.white
                                  : KColors.of(context).accentColor),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
