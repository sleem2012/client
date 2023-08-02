// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:forall_client/data/models/products/products_model.dart';
// import 'package:forall_client/data/models/user_info/user_model.dart';
// import 'package:forall_client/logic/nav_enforcer/nav_enforcer_bloc.dart';
// import 'package:forall_client/logic/products/pro_helper.dart';
// import 'package:forall_client/logic/products/product_details/product_details_bloc_cubit.dart';
// import 'package:forall_client/logic/products/product_details/product_details_bloc_state.dart';
// import 'package:forall_client/shared/localization/trans.dart';
// import 'package:forall_client/shared/theme/colors.dart';
// import 'package:forall_client/shared/theme/helper.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
// import 'package:forall_client/views/services/company/company_details.dart';
// import 'package:forall_client/views/services/products/review_screen.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// class ProductInfo extends StatelessWidget {
//   const ProductInfo({Key? key, required this.isVisibleCart, required this.data}) : super(key: key);
//   final bool isVisibleCart;
//   final ProductsSystemData data;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
//       builder: (context, state) {
//         final details = ProductDetailsBloc.of(context);
//
//         return Container(
//           padding: const EdgeInsets.all(20),
//           width: double.infinity,
//           decoration: KHelper.of(context).elevatedBox,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     details.proName ?? '',
//                     style: KTextStyle.of(context).title2.copyWith(fontSize: 12),
//                   ),
//                   const SizedBox(height: 5),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => ReviewsScreen(id: details.proMenuId));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         RatingBar.builder(
//                           initialRating: ProductHelper.reviewAvg([details.selectedProductMenu]),
//                           allowHalfRating: true,
//                           itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
//                           onRatingUpdate: (rating) {},
//                           itemSize: 9,
//                         ),
//                         const SizedBox(width: 5),
//                         Text("${details.productsSys.products?.first.review?.length}", style: KTextStyle.of(context).body3),
//                         const SizedBox(width: 5),
//                         Text(Tr.get.reviews, style: KTextStyle.of(context).body3),
//                         const Icon(Icons.arrow_drop_down, size: 10)
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text('${Tr.get.price} : ', style: KTextStyle.of(context).hint),
//                       Text("${details.selectedProductMenu?.price}", style: KTextStyle.of(context).body2),
//                       // const SizedBox(width: 8),
//                       if (details.selectedProductMenu?.has_offer ?? false)
//                         Text(
//                           "${details.selectedProductMenu?.discount}",
//                           style: KTextStyle.of(context).hint.copyWith(decoration: TextDecoration.lineThrough),
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // SizedBox(
//                   //   width: 90,
//                   //   height: 20,
//                   //   child: RawMaterialButton(
//                   //     onPressed: () {},
//                   //     fillColor: KColors.of(context).freeShiping,
//                   //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   //     child: Text(
//                   //       Tr.get.shipped_from_abroad,
//                   //       style: KTextStyle.of(context).editBTN.copyWith(fontSize: 8, color: Colors.black),
//                   //     ),
//                   //   ),
//                   // ),
//                   const SizedBox(height: 5),
//                   if (isVisibleCart)
//                     Row(
//                       children: [
//                         InkWell(
//                           child: Container(
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
//                             child: const Icon(Icons.remove, color: Colors.white, size: 10),
//                           ),
//                           onTap: () {
//                             details.decreaseProductAmount();
//                           },
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           details.productAmount.toString(),
//                           style: KTextStyle.of(context).body.copyWith(color: KColors.of(context).text),
//                         ),
//                         const SizedBox(width: 8),
//                         InkWell(
//                           onTap: () {
//                             details.increaseProductAmount();
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
//                             child: const Icon(Icons.add, color: Colors.white, size: 10),
//                           ),
//                         ),
//                       ],
//                     ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     width: 90,
//                     height: 20,
//                     child: RawMaterialButton(
//                       onPressed: () {
//                         Nav.to(CompanyDetailsView(data: data.company ?? UserCompany()));
//                       },
//                       fillColor: KColors.of(context).freeShiping,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                       child: Text(
//                         Tr.get.company,
//                         style: KTextStyle.of(context).editBTN.copyWith(fontSize: 8, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
