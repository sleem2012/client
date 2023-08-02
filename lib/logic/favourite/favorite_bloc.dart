import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/favourite/favourite_model.dart';
import '../../data/models/products/products_model.dart';
import '../../data/repository/favourite/favourite_repo.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import 'favourite_state.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  FavoriteBloc({required this.favouriteRepoImp}) : super(const FavoriteState.loading());

  static FavoriteBloc of(BuildContext context) {
    return BlocProvider.of<FavoriteBloc>(context);
  }

  final FavouriteRepoImp favouriteRepoImp;
  FavouriteResponseModel? favouriteModel;

  int page = 1;
  int totalPages = 1;
  int perPage = 10;
  int totalItems = 0;

  get(bool isMore) async {
    if (KStorage.i.getToken == null) return;
    if (isMore && totalPages > page) {
      page++;
      emit(const FavoriteState.loadMore());
    } else if (isMore && totalPages == page) {
      return;
    } else {
      page = 1;
      emit(const FavoriteState.loading());
    }
    try {
      final result = await favouriteRepoImp.get(page: page, page_count: perPage);
      result.fold(
        (l) {
          debugPrint('================= Favourite Bloc : ${KFailure.toError(l)}');
          emit(FavoriteState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= Favourite Bloc : ${r.toString()}  ');
          if (isMore) {
            favouriteModel = favouriteModel?.copyWith(data: favouriteModel?.data?..addAll(r.data ?? []));
          } else {
            favouriteModel = r;
          }
          totalPages = (favouriteModel!.pagination!.meta!.total! / perPage).ceil();
          totalItems = (favouriteModel!.pagination!.meta!.total!);
          emit(const FavoriteState.success());
        },
      );
    } catch (e) {
      debugPrint('================= Favourite Bloc (Catch): ${e.toString()} ');
      emit(FavoriteState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  add(int? pro_id, ProductsSystemData? data) async {
    try {
      emit(FavoriteState.toggling(id: pro_id ?? 0));
      final current = favouriteModel?.data;

      if ((favouriteModel?.data?.where((element) => element.productId?.id == pro_id) ?? []).isEmpty) {
        favouriteModel = favouriteModel?.copyWith(
          data: favouriteModel?.data ?? []
            ..insert(0, FavouriteDataModel(id: 0, productId: data)),
        );
      } else {
        return;
      }
      emit(const FavoriteState.toggleLocaleSuccess());

      final result = await favouriteRepoImp.add(id: pro_id);
      result.fold(
        (l) {
          debugPrint('================= Favourite Bloc : ${KFailure.toError(l)}');
          favouriteModel = favouriteModel?.copyWith(data: current);
          emit(FavoriteState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= Favourite Bloc : success ');
          emit(const FavoriteState.toggleSuccess());
        },
      );
    } catch (e) {
      debugPrint('================= Favourite Bloc (Catch): ${e.toString()} ');
      emit(FavoriteState.error(error: Tr.get.something_went_wrong));
    }
  }

  del(int? fav_id, ProductsSystemData? data) async {
    try {
      emit(FavoriteState.toggling(id: fav_id ?? 0));
      final current = favouriteModel?.data;
      favouriteModel = favouriteModel?.copyWith(data: favouriteModel?.data?..removeWhere((element) => element.id == fav_id));

      emit(const FavoriteState.toggleLocaleSuccess());
      final result = await favouriteRepoImp.del(id: fav_id);
      result.fold(
        (l) {
          debugPrint('================= Favourite Bloc : ${KFailure.toError(l)}');
          emit(FavoriteState.error(error: KFailure.toError(l)));
          favouriteModel = favouriteModel?.copyWith(data: current);
          emit(const FavoriteState.toggleSuccess());
        },
        (r) {
          debugPrint('================= Favourite Bloc : success ');
          emit(const FavoriteState.toggleSuccess());
        },
      );
    } catch (e) {
      debugPrint('================= Favourite Bloc (Catch): ${e.toString()} ');
      emit(FavoriteState.error(error: Tr.get.something_went_wrong));
    }
  }

  bool isFav(int id) {
    return (favouriteModel?.data?.where((element) => element.productId?.id == id) ?? []).isNotEmpty;
  }
}
