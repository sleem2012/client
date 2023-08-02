import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di.dart';
import '../../../map/logic/map_search_bloc/map_search_bloc.dart';
import '../../../map/logic/map_search_bloc/map_search_state.dart';
import '../../../map/logic/model/search_results_model.dart';
import '../../../map/map_view/search_bar.dart';
import '../booking_view/widgets/place_tile.dart';

class LocationSearchScreen extends StatelessWidget {
  const LocationSearchScreen({
    Key? key,
    required this.address,
    this.onMove,
    this.onStop,
    required this.goTonPlace,
    required this.setSelectedPosition,
    required this.getDetailedAddress,
  }) : super(key: key);
  final String? address;
  final VoidCallback? onMove;
  final VoidCallback? onStop;
  final Function goTonPlace;
  final Function setSelectedPosition;
  final Function getDetailedAddress;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.mapSearchBloc..setCtrlInitial(address),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: LocationSearchBar(
                  onMove: onMove ?? () {},
                  onStop: onStop ?? () {},
                ),
              ),
              Expanded(
                child: BlocBuilder<MapSearchBloc, MapSearchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error) => const SizedBox(),
                      success: (model) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: model?.predictions?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) => PlaceTile(
                          data: (model?.predictions ?? <Predictions>[])[index],
                          goTonPlace: goTonPlace,
                          setSelectedPosition: setSelectedPosition,
                          getDetailedAddress: getDetailedAddress,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
