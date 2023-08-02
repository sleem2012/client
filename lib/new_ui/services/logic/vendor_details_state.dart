part of 'vendor_details_cubit.dart';

@immutable
abstract class VendorDetailsState {}

class VendorDetailsInitial extends VendorDetailsState {}
class ChangeIndex extends VendorDetailsState {
  final int index;

  ChangeIndex(this.index);
}
