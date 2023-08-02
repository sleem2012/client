import 'package:freezed_annotation/freezed_annotation.dart';
part 'feature_type.freezed.dart';

@freezed
 class FeatureType with _$FeatureType {
  const factory FeatureType.shopping() = FeatureTypeShopping;
  const factory FeatureType.ticketing() = FeatureTypeTicketing;
  const factory FeatureType.service() = FeatureTypeService;
  const factory FeatureType.carrying() = FeatureTypeCarrying;
  const factory FeatureType.display() = FeatureTypeDisplay;
  const factory FeatureType.client_base() = FeatureTypeClientBase;

  static FeatureType formString(String str) {
    switch (str) {
      case 'shopping':
        return const FeatureType.shopping();
      case 'ticketing':
        return const FeatureType.ticketing();
      case 'service':
        return const FeatureType.service();
      case 'carrying':
        return const FeatureType.carrying();
      case 'displaying':
        return const FeatureType.display();
      case 'client_base':
        return const FeatureType.client_base();
      default:
        return const FeatureType.shopping();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs