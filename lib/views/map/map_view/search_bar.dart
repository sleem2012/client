import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../logic/map_search_bloc/map_search_bloc.dart';
import '../logic/map_search_bloc/map_search_state.dart';
import '../../widgets/search_package/material_floating_search_bar.dart';


class LocationSearchBar extends StatelessWidget {
  const LocationSearchBar({Key? key, required this.onMove, required this.onStop}) : super(key: key);
  final VoidCallback onMove;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocConsumer<MapSearchBloc, MapSearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        final search = MapSearchBloc.of(context);
        return FloatingSearchBar(
          controller: search.controller,
          onFocusChanged: (value) {
            if (value) {
              onMove();
            } else {
              onStop();
            }
          },
          backdropColor: Colors.transparent,
          backgroundColor: KColors.of(context).elevatedBox,
          hint: search.controller.query.isEmpty ? Tr.get.search : search.controller.query,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 300),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            search.search(query);
          },
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(icon: const Icon(Icons.place), onPressed: () {}),
            ),
            FloatingSearchBarAction.searchToClear(showIfClosed: false),
          ],
          builder: (context, transition) {
            return const SizedBox();
          },
        );
      },
    );
  }
}
