import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../map/logic/map_cubit/map_bloc.dart';
import '../../../../map/logic/map_cubit/map_state.dart';
import 'destination_tile.dart';

class DestinationsList extends StatelessWidget {
  const DestinationsList({Key? key, required this.reset}) : super(key: key);
  final VoidCallback reset;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        final list = MapBloc.of(context).destinations;
        final model = MapBloc.of(context);

        return list.isEmpty
            ? const SizedBox()
            : ReorderableListView.builder(
                itemBuilder: (context, index) => SizedBox(
                  key: ValueKey(index),
                  child: DestinationTile(
                    key: UniqueKey(),
                    index: index,
                    model: list[index],
                    onDelete: () {
                      reset();
                      model.deleteFromDestinations(
                        list[index],
                      );
                    },
                  ),
                ),
                buildDefaultDragHandles: false,

                // separatorBuilder: (context, index) => const SizedBox(),
                itemCount: list.length,
                onReorder: (int oldIndex, int newIndex) {
                  final index = newIndex < oldIndex ? newIndex : newIndex - 1;
                  final data = list.removeAt(oldIndex);
                  list.insert(index, data);

                  debugPrint(oldIndex.toString());
                  debugPrint(newIndex.toString());
                },
              );
      },
    );
  }
}
