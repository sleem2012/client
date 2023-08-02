import 'package:flutter/material.dart';

import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import 'drop_down.dart';

class KSlugDropdown extends StatelessWidget {
  final Function(KSlugModel?)? onChanged;
  final String? value;
  final List<KSlugModel> items;
  final String? hint;

  const KSlugDropdown({Key? key, this.onChanged, this.value, required this.items, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KDropdownBtn<KSlugModel>(
      onChanged: onChanged!,
      value: KSlugModel.of(value),
      items: items.map((e) => KHelper.of(context).itemView<KSlugModel>(itemText: e.translated, value: e)).toList(),
      title: hint ?? Tr.get.gender,
    );
  }
}

class KSlugModel {
  final String translated;
  final String slug;

  KSlugModel({required this.translated, required this.slug});

  ///Find Model By Slug
  static KSlugModel? of(String? slug) {
    switch (slug) {
      case _male:
        return KSlugModel(translated: Tr.get.male, slug: _male);
      case _female:
        return KSlugModel(translated: Tr.get.female, slug: _female);
      case inPayment:
        return KSlugModel(translated: 'in_payment', slug: inPayment);
      case pending:
        return KSlugModel(translated: Tr.get.pending_requests, slug: pending);
      case completed:
        return KSlugModel(translated: Tr.get.history_requests, slug: completed);
      case refund:
        return KSlugModel(translated: 'refund', slug: refund);
      case order:
        return KSlugModel(translated: Tr.get.order, slug: order);
      case rider:
        return KSlugModel(translated: Tr.get.rider, slug: rider);
      case vendor:
        return KSlugModel(translated: Tr.get.vendor, slug: vendor);

      default:
        return null;
    }
  }

  ///Lists of Slugs & Trans
  static List<KSlugModel> get genders => [
        KSlugModel(translated: Tr.get.male, slug: _male),
        KSlugModel(translated: Tr.get.female, slug: _female),
      ];

  static List<KSlugModel> get OrderState => [
        KSlugModel(translated: Tr.get.status, slug: inPayment),
        KSlugModel(translated: Tr.get.completed, slug: completed),
        KSlugModel(translated: Tr.get.returns, slug: refund),
      ];

  static List<KSlugModel> get DeliveringOrderState => [
        KSlugModel(translated: Tr.get.status, slug: pending),
        KSlugModel(translated: Tr.get.history_requests, slug: completed),
      ];

  static List<KSlugModel> get reviewType => [
        KSlugModel(translated: Tr.get.order, slug: order),
        KSlugModel(translated: Tr.get.rider, slug: rider),
        KSlugModel(translated: Tr.get.vendor, slug: vendor),
      ];
  static List<KSlugModel> get requestQuoteStates => [
        KSlugModel(translated: Tr.get.opened, slug: opened),
        KSlugModel(translated: Tr.get.completed, slug: completed),
        KSlugModel(translated: Tr.get.canceled, slug: canceled),
      ];

  ///Const String Slugs
  ///
  static const String _male = "male";
  static const String _female = "female";

  //Order States
  static const String inPayment = "in_payment";
  static const String pending = "pending";
  static const String completed = "completed";
  static const String refund = "refund";
  static const String order = "order";
  static const String rider = "rider";
  static const String vendor = "vendor";
  static const String lookingForRider = "looking_for_rider";
  static const String lookingForDriver = "looking_for_driver";
  static const String onDelivering = "on_delivering";
  static const String arrivedClient = 'arrived_client';
  static const String completedCode = 'completed_code';
  static const String userNotFound = 'user_not_found';
  static const String canceled = 'canceled';
  static const String opened = 'opened';
  static const String accident = 'accident';
  static const String paymentNeeded = 'payment_needed';
  static const String waitingDriver = 'waiting_driver';
  static const String waitingUser = 'waiting_user';

  //order update state
  static const String onWay = "on_way"; //rider
  static const String arrivedVendor = "arrived_vendor"; //rider
  static const String riderVerifyCode = "rider_verify_code"; //vendor

  static const String neww = "new";

  //Equality
  @override
  String toString() => slug;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KSlugModel && other.translated == translated && other.slug == slug;
  }

  @override
  int get hashCode => translated.hashCode ^ slug.hashCode;
}
