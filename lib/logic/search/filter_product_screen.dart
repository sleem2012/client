import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../data/models/services/category_model.dart';
import '../../di.dart';
import '../../packages/extensions.dart';
import '../company/company_bloc.dart';
import '../company/company_state.dart';
import '../products/color/color_bloc.dart';
import '../products/color/color_state.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../../views/widgets/appbar.dart';
import '../../views/widgets/custom_button.dart';
import '../../views/widgets/drop_down.dart';
import '../../views/widgets/loading/loading_overlay.dart';
import '../../views/widgets/new_bg_img.dart';
import '../../views/widgets/shimmer_box.dart';
import '../../views/widgets/text_field.dart';
import 'package:get/get.dart';

class FilterProductScreen extends StatelessWidget {
  const FilterProductScreen({Key? key, required this.supCatChild}) : super(key: key);
  final CategoryModel supCatChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: "Filter"),
      body: BgImg(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(KHelper.hPadding),
          child: BlocProvider(
            create: (_) => Di.compBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h,
                Text(
                  'main category',
                  style: KTextStyle.of(context).black_grey_bold.S(1.4),
                ),
                10.h,
                Builder(builder: (context) {
                  return KDropdownBtn<CategoryModel>(
                    title: "main cat",
                    onChanged: (p0) {
                      // selectedCat = p0 ?? CategoryModel();
                      CompanyBloc.of(context).getCompanies(false, cat_id: p0?.id, com_type_id: null);
                      // setState(() {
                      //
                      // });
                      // debugPrint(selectedCat?.name);
                    },
                    items: supCatChild.children?.map((e) => KHelper.of(context).itemView(itemText: e.name ?? '', value: e)).toList() ?? [],
                  );
                }),
                BlocBuilder<CompanyBloc, CompanyState>(
                  builder: (context, state) {
                    final brands = CompanyBloc.of(context).compModel?.data ?? [];
                    return (CompanyBloc.of(context).compModel?.data ?? []).isNotEmpty
                        ? Column(children: [
                            20.h,
                            Text(
                              'Brand',
                              style: KTextStyle.of(context).black_grey_bold.S(1.4),
                            ),
                            10.h,
                            KRequestOverlay(
                              isLoading: state is CompanyStateLoading,
                              loadingWidget: ShimmerBox(
                                width: Get.width,
                                height: 30,
                              ),
                              child: KDropdownBtn(
                                title: "Brand",
                                onChanged: (p0) {},
                                items: brands.map((e) => KHelper.of(context).itemView(itemText: e.name?.value ?? '', value: e)).toList(),
                              ),
                            )
                          ])
                        : SizedBox();
                  },
                ),
                20.h,
                Text(
                  Tr.get.price,
                  style: KTextStyle.of(context).black_grey_bold.S(1.4),
                ),
                10.h,
                Row(
                  children: [
                    Expanded(
                      child: KTextFormField(
                        hintText: Tr.get.from,
                        onChanged: (p0) {},
                      ),
                    ),
                    10.w,
                    Expanded(
                      child: KTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: Tr.get.to,
                        onChanged: (p0) {},
                      ),
                    ),
                  ],
                ),
                20.h,
                Text(
                  Tr.get.color,
                  style: KTextStyle.of(context).black_grey_bold.S(1.4),
                ),
                10.h,
                BlocBuilder<ColorBloc, ColorState>(
                  builder: (context, state) {
                    final color = ColorBloc.of(context).model;
                    debugPrint("${color?.length}sadasdas");
                    return KRequestOverlay(
                      isLoading: state is ColorStateLoading,
                      child: KDropdownBtn(
                        title: Tr.get.color,
                        onChanged: (p0) {},
                        items: color?.map((e) => KHelper.of(context).itemView(itemText: e.name?.value ?? '', value: e)).toList() ?? [],
                      ),
                    );
                  },
                ),
                20.h,
                Text(
                  Tr.get.ratings.capitalized,
                  style: KTextStyle.of(context).black_grey_bold.S(1.4),
                ),
                10.h,
                RatingBar.builder(
                  initialRating: 4,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                  onRatingUpdate: (rating) {},
                  itemSize: 30,
                ),
                100.h,
                KButton(
                  title: Tr.get.done,
                  onPressed: () {
                    KHelper.showSnackBar(Tr.get.no_products);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
