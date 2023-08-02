

import '../../../shared/localization/trans.dart';

class KJobState {
  final String name;
  final bool slug;

  KJobState({required this.name, required this.slug});

  static List<KJobState> list = [
    KJobState(name: Tr.get.offers, slug: offers),
    KJobState(name: Tr.get.applied, slug: applied),
  ];

  static const bool applied = true;
  static const bool  offers = false;
}


// class KOrderState {
//   final String name;
//   final bool slug;
//
//   KOrderState({required this.name, required this.slug});
//
//   static List<KJobState> list = [
//     KJobState(name: "Status", slug: offers),
//     KJobState(name: "Returns", slug: applied),
//   ];
//
//   static const bool applied = true;
//   static const bool  offers = false;
// }

