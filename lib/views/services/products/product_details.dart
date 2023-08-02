// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forall_client/data/models/products/products_model.dart';
// import 'package:forall_client/di.dart';
// import 'package:forall_client/logic/cart/cart_bloc.dart';
// import 'package:forall_client/logic/cart/cart_state.dart';
// import 'package:forall_client/logic/hotels/hotel_extra_bloc.dart';
// import 'package:forall_client/logic/products/product_details/product_details_bloc_cubit.dart';
// import 'package:forall_client/logic/products/product_details/product_details_bloc_state.dart';
// import 'package:forall_client/shared/localization/trans.dart';
// import 'package:forall_client/shared/theme/helper.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
// import 'package:forall_client/views/services/widgets/extra_widget.dart';
// import 'package:forall_client/views/services/widgets/product_attrs.dart';
// import 'package:forall_client/views/services/widgets/product_colors.dart';
// import 'package:forall_client/views/services/widgets/product_description.dart';
// import 'package:forall_client/views/services/widgets/product_info.dart';
// import 'package:forall_client/views/services/widgets/schedule_picker.dart';
// import 'package:forall_client/views/widgets/appbar.dart';
// import 'package:forall_client/views/widgets/custom_button.dart';
// import 'package:forall_client/views/widgets/not_loggedin.dart';
// import 'package:forall_client/views/widgets/text_field.dart';
// import 'package:get/get.dart';
//
// import '../widgets/product_header.dart';
//
// class ProductDetails extends StatefulWidget {
//   final ProductsSystemData productsData;
//   final List<ProductsSystemData> similar;
//
//   const ProductDetails({Key? key, required this.productsData, required this.similar}) : super(key: key);
//
//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }
//
// class _ProductDetailsState extends State<ProductDetails> {
//   @override
//   void initState() {
//     if (widget.productsData.hasTimePicker == true) {
//       //ScheduleBloc.of(context).getSchedule();
//     }
//     debugPrint(widget.productsData.category!.isCartVisible!.toString());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => ProductDetailsBloc()..setProduct(widget.productsData)),
//         BlocProvider(create: (context) => Di.hotelExtraBloc..setProductMenu((widget.productsData.products ?? []).first)..setAmountMap()),
//       ],
//       child: Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: const KAppBar(title: '', showCart: true),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: BlocBuilder<CartBloc, CartState>(
//             builder: (context, state) {
//               final cartBloc = CartBloc.of(context);
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const ProductHeader(),
//                   const SizedBox(height: 10),
//                   ProductInfo(isVisibleCart: widget.productsData.category!.isCartVisible!, data: widget.productsData),
//                   (ProductDetailsBloc.of(context).sellectedColor != null || ProductDetailsBloc.of(context).sellectedColor != null)
//                       ? const ProductColors()
//                       : const SizedBox(height: 10),
//                   const ProductDescription(),
//                   BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
//                     builder: (context, state) => ProductAttributesView(
//                       productMenu: ProductDetailsBloc.of(context).selectedProductMenu ?? ProductMenu(),
//                     ),
//                   ),
//                   const ExtraWidget(),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 15),
//                     margin: const EdgeInsets.symmetric(vertical: 3),
//                     decoration: KHelper.of(context).elevatedBox,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(Tr.get.note, style: KTextStyle.of(context).title3),
//                         const SizedBox(height: 10),
//                         KTextFormField(controller: cartBloc.noteController, hintText: Tr.get.add_note_if_you_have),
//                       ],
//                     ),
//                   ),
//                   // SimilarProduct(similar: widget.similar),
//                   const SizedBox(height: 15)
//                 ],
//               );
//             },
//           ),
//         ),
//         bottomNavigationBar: widget.productsData.category!.isCartVisible!
//             ? KNotLoggedInWidget(
//                 child: BlocConsumer<CartBloc, CartState>(
//                   listener: (context, state) {
//                     state.whenOrNull(success: (model) => KHelper.showSnackBar(model?.message ?? ''));
//                   },
//                   builder: (context, state) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       child: KButton(
//                         title: Tr.get.add_to_Cart,
//                         height: 40,
//                         isLoading: state.maybeWhen(AddLoading: () => true, orElse: () => false),
//                         onPressed: () async {
//                           final proBloc = HotelExtraBloc.of(context);
//                           final cartBloc = CartBloc.of(context);
//                           final details = ProductDetailsBloc.of(context);
//                           debugPrint(proBloc.productMenu?.amount.toString());
//
//                           if (widget.productsData.hasTimePicker == true) {
//                             final dateFrom = widget.productsData.isOneTime!
//                                 ? await Get.bottomSheet<DateTime>(
//                                     SchedulePicker(pro_menu_id: proBloc.productMenu?.id, duration: proBloc.productMenu?.duration ?? 0),
//                                   )
//                                 : await Get.bottomSheet<DateTime>(
//                                     ScheduleRangePicker(duration: proBloc.productMenu?.duration ?? 0, pro_menu_id: proBloc.productMenu?.id),
//                                   );
//                             if (dateFrom == null) return;
//                             final dateTo = !widget.productsData.isOneTime!
//                                 ? await Get.bottomSheet<DateTime>(
//                                     ScheduleRangePicker(
//                                       duration: proBloc.productMenu?.duration ?? 0,
//                                       pro_menu_id: proBloc.productMenu?.id,
//                                       firstDate: dateFrom..add(const Duration(days: 1)),
//                                     ),
//                                   )
//                                 : null;
//                             if (dateTo == null && !widget.productsData.isOneTime!) return;
//
//                             String formattedDate = KHelper.apiDateFormatter(dateFrom);
//                             String? formattedDateTo = dateTo != null ? KHelper.apiDateFormatter(dateTo) : null;
//                             cartBloc.addToCart(
//                               proBloc.productMenu?.id ?? -1,
//                               details.productAmount,
//                               extraIds: proBloc.extraIds.toSet().toList(),
//                               extraAmount: proBloc.extraAmountList,
//                               date: formattedDate,
//                               dateTo: formattedDateTo,
//                             );
//                           } else {
//                             cartBloc.addToCart(
//                               proBloc.productMenu?.id ?? -1,
//                               details.productAmount,
//                               extraIds: proBloc.extraIds.toSet().toList(),
//                               extraAmount: proBloc.extraAmountList,
//                             );
//                           }
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               )
//             : const SizedBox(),
//       ),
//     );
//   }
// }
