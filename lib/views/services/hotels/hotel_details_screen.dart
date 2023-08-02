import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/products/products_model.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../di.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/cart/cart_state.dart';
import '../../../logic/hotels/hotel_extra_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../widgets/extra_widget.dart';
import '../widgets/product_attrs.dart';
import '../widgets/schedule_picker.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/not_loggedin.dart';
import '../../../packages/shared/picker/view/static_map_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'widget/hotel_gallery.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({Key? key, required this.data}) : super(key: key);
  final ProductsSystemData data;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: widget.data.products?.length ?? 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imgData = widget.data.company?.coverPhotos;
    final latLang = widget.data.company?.owner?.addressId;
    return Scaffold(
      appBar: const KAppBar(title: ''),
      body: BgImg(
        child: ListView(
          children: [
            HotelGallery(img: imgData ?? <Logo>[]),
            SizedBox(
              height: 129,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: InkWell(
                  onTap: () {
                    final String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${latLang?.latitude ?? "0"},${latLang?.longitude ?? '0'}';
                    launchUrlString(googleUrl, mode: LaunchMode.externalNonBrowserApplication);
                  },
                  child: MapStaticView(
                    latLng: LatLng(double.tryParse(latLang?.latitude ?? "0") ?? 0.0, double.tryParse(latLang?.longitude ?? '0') ?? 0.0),
                    zoom: '15',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
              controller: tabCtrl,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: (widget.data.products ?? [])
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(child: Text(e.price ?? '', style: KTextStyle.of(context).title2)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: Get.height,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabCtrl,
                children: (widget.data.products ?? []).map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocProvider(
                      create: (context) => Di.hotelExtraBloc
                        ..setProductMenu(e)
                        ..setAmountMap(),
                      child: Column(
                        children: [
                          // ProductInfo(productMenu: e),
                          const SizedBox(height: 10),
                          ProductAttributesView(productMenu: e),
                          const ExtraWidget(),
                          widget.data.category!.isCartVisible!
                              ? KNotLoggedInWidget(
                                  child: BlocConsumer<CartBloc, CartState>(
                                    listener: (context, state) {
                                      state.whenOrNull(success: (model) => KHelper.showSnackBar(model?.message ?? ''));
                                    },
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: KButton(
                                          title: Tr.get.add_to_Cart,
                                          height: 40,
                                          isLoading: state.maybeWhen(AddLoading: () => true, orElse: () => false),
                                          onPressed: () async {
                                            debugPrint(widget.data.hasTimePicker.toString());
                                            final proBloc = HotelExtraBloc.of(context);
                                            final cartBloc = CartBloc.of(context);
                                            if (widget.data.hasTimePicker == true) {
                                              final dateFrom = widget.data.isOneTime!
                                                  ? await Get.bottomSheet<DateTime>(SchedulePicker(pro_menu_id: e.id, duration: e.duration ?? 0))
                                                  : await Get.bottomSheet<DateTime>(ScheduleRangePicker(duration: e.duration ?? 0, pro_menu_id: e.id));
                                              if (dateFrom == null) return;
                                              final dateTo = !widget.data.isOneTime!
                                                  ? await Get.bottomSheet<DateTime>(
                                                      ScheduleRangePicker(
                                                        duration: e.duration ?? 0,
                                                        pro_menu_id: e.id,
                                                        firstDate: dateFrom..add(const Duration(days: 1)),
                                                      ),
                                                    )
                                                  : null;
                                              if (dateTo == null && !widget.data.isOneTime!) return;

                                              String formattedDate = KHelper.apiDateFormatter(dateFrom);
                                              String? formattedDateTo = dateTo != null ? KHelper.apiDateFormatter(dateTo) : null;
                                              cartBloc.addToCart(
                                                e.id ?? -1,
                                                1,
                                                extraIds: proBloc.extraIds.toSet().toList(),
                                                extraAmount: proBloc.extraAmountList,
                                                date: formattedDate,
                                                dateTo: formattedDateTo,
                                              );
                                            } else {
                                              cartBloc.addToCart(
                                                e.id ?? -1,
                                                1,
                                                extraIds: proBloc.extraIds.toSet().toList(),
                                                extraAmount: proBloc.extraAmountList,
                                              );
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
