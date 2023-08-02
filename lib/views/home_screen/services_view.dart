import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/search/search_manager.dart';
import '../../logic/services/services_cubit.dart';
import '../../logic/services/services_state.dart';
import '../../logic/theme/theme_cubit.dart';
import '../../new_ui/sup_cat/cat_grid_view.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../main_screen/video_player_view.dart';
import '../notifications/view/notifications_list.dart';
import '../services/widgets/shimmer_grid.dart';
import '../widgets/error/error_widget.dart';
import '../../packages/widgets/icon_button.dart';
import '../widgets/not_loggedin.dart';

import '../../data/models/services/service_type.dart';
import '../../data/models/services/services_model.dart';
import '../../packages/cache/locale_storage.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final vidH = (size.width * 9 / 16) - MediaQuery.of(context).padding.top;
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: SvgPicture.asset(
                'assets/images/dr_${ThemeBloc.of(context).strTheme}.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            CustomScrollView(
              controller: _controller,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                if (KStorage.i.getvideo != null)
                  SliverAppBar(
                    excludeHeaderSemantics: true,
                    floating: true,
                    forceElevated: true,
                    expandedHeight: vidH,
                    leading: const SizedBox.expand(),
                    actions: [
                      KNotLoggedInWidget(
                        child: KIconButton(
                          child: Icon(KHelper.notifications, color: KColors.of(context).accentColor, size: 18),
                          onPressed: () {
                            Nav.to(const NotificationsList());
                          },
                        ),
                      )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: const [
                          VideoPlayerView(),
                        ],
                      ),
                    ),
                  ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (state.maybeWhen(orElse: () => false, error: (error) => true))
                        KErrorWidget(
                          error: state.whenOrNull(error: (error) => error),
                          isError: true,
                          onTryAgain: ServicesCubit.of(context).getServices,
                        )
                      else if (state.maybeWhen(orElse: () => false, loading: () => true))
                        const ShimmerGrid(
                          count: 3,
                          aspectRatio: 1.35,
                          shrinkWrap: true,
                          child: SubCatShimmer(),
                        )
                      else
                        SearchableView<ServicesData>(
                          initialList: ServicesCubit.of(context).servicesData,
                          where: (item) => item.name,
                          onFocus: () async {
                            await _controller.animateTo(
                              vidH,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          builder: (list) {
                            return GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 0).copyWith(bottom: 110, top: 20),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.2),
                              itemBuilder: (c, i) => CategoryNameIcon(
                                icon: list[i].icons,
                                name: list[i].name,
                                onTap: () {
                                  final route = ServicesCubit.of(context).getServiceRoute(
                                    servicesData: list[i],
                                    from: const RouteingFrom.service(null),
                                  );
                                  Nav.to(route);
                                },
                              ),
                              itemCount: list.length,
                            );
                          },
                        )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
