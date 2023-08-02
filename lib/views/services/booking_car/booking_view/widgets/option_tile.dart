// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:forall_client/shared/theme/colors.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
//
// import 'package:get/get.dart';
//
// class OptionTile extends StatelessWidget {
//   const OptionTile({Key? key, required this.onDismiss}) : super(key: key);
//   final void Function() onDismiss;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onDismiss,
//       child: Container(
//         height: Get.height / 7.5,
//         padding: const EdgeInsets.all(10),
//         color: KColors.of(context).accentColor,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               height: Get.height,
//               color: KColors.of(context).accentColor,
//               child: const Center(
//                   child: Icon(
//                 Icons.more_vert,
//                 color: Colors.white,
//                 size: 30,
//               )),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset('assets/images/Icon feather-alert-triangle.svg', width: 20),
//                       Text(
//                         'Complain',
//                         style: KTextStyle.of(context).title4.copyWith(color: Colors.white),
//                       )
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset('assets/images/Icon feather-eye-off.svg', width: 20),
//                       Text(
//                         'Hide',
//                         style: KTextStyle.of(context).title4.copyWith(color: Colors.white),
//                       )
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset('assets/images/Icon metro-location.svg', width: 13),
//                       Text(
//                         'Show on map',
//                         style: KTextStyle.of(context).title4.copyWith(color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
