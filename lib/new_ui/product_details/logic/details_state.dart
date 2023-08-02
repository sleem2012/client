part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class SelectMainState extends DetailsState {}
class ChangeMain extends DetailsState {}
class ChangeAmount extends DetailsState {}
