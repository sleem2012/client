import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/favourite/favorite_bloc.dart';
import '../../logic/favourite/favourite_state.dart';
import '../../shared/localization/trans.dart';
import 'widget/favorite_card.dart';
import '../widgets/empty_widget.dart';
import '../widgets/load_more_wrapper.dart';
import '../widgets/loading/loading_overlay.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return KLoadingOverlay(
          isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
          child: EmptyWidget(
            list:FavoriteBloc.of(context).favouriteModel?.data?? [],
            title: Tr.get.no_favourite,
            imagePath: "assets/images/no_favorite.svg",
            child: LoadMoreWrapper(
                    padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 160, top: 10),
                    itemBuilder: (context, i) => FavoriteCard(
                      model: FavoriteBloc.of(context).favouriteModel!.data![i],
                      similer: FavoriteBloc.of(context).favouriteModel!.data!.map((e) => e.productId!).toList(),
                    ),
                    itemCount: FavoriteBloc.of(context).favouriteModel?.data?.length ?? 0,
                    crossAxisCount: 1,
                    isLoadingMore: state.maybeWhen(orElse: () => false, loadMore: () => true),
                    onLoadMore: () async {
                      FavoriteBloc.of(context).get(true);
                    },
                    onRefresh: () async {
                      FavoriteBloc.of(context).get(false);
                    },
                  ),
          )

        );
      },
    );
  }
}

//FavoriteCard(
///   model: FavouriteBloc.of(context).favouriteModel!.data![i],
///   similer: FavouriteBloc.of(context).favouriteModel!.data!.map((e) => e.productId!).toList(),
/// )
