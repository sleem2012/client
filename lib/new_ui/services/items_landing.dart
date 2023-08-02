import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/views/widgets/loading/loading_overlay.dart';
import 'package:forall_client/views/widgets/new_bg_img.dart';
import '../../data/models/services/category_model.dart';
import '../../di.dart';
import '../../shared/theme/helper.dart';
import '../../data/models/services/service_type.dart';
import '../../views/widgets/appbar.dart';
import 'widget/rooms_list.dart';
import '../../logic/products/product_system_bloc/products_bloc.dart';
import '../../logic/products/product_system_bloc/products_state.dart';
import 'logic/vendor_details_cubit.dart';
import 'widget/menu_list.dart';

class ItemsLanding extends StatelessWidget {
  const ItemsLanding({Key? key, required this.compId, required this.type, required this.hasMulti, this.category}) : super(key: key);
  final int compId;
  final ServiceType? type;
  final bool hasMulti;
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Di.getProductsBloc
            ..add(
              GetProductsEvents.get(isMore: false, companyId: compId, sub: category),
            ),
        ),
        BlocProvider(create: (context) => SectionTabsCubit()..setProSysList(date: GetProductsBloc.of(context).productsModel?.data ?? [])),
      ],
      child: Scaffold(
        appBar: hasMulti ?  KAppBar() : null,
        body: BgImg(
          
          child: BlocBuilder<GetProductsBloc, GetProductsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(KHelper.hPadding),
                child: state.maybeWhen(
                      error: (error) => const SizedBox(),
                      orElse: () => type?.maybeWhen(
                        orElse: () => MenuList(id: compId),
                        Filters: () => RoomList(),
                      ),
                      loading: () => const KLoadingOverlay(isLoading: true),
                    ) ??
                    MenuList(id: compId),
              );
            },
          ),
        ),
      ),
    );
  }
}
