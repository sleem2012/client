import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/models/in_drive/trip_model.dart';
import '../../../../../di.dart';
import '../../../../../logic/in_drive/get/get_in_drive_bloc.dart';
import '../../../../../logic/in_drive/get/get_in_drive_state.dart';
import '../indriver_screen.dart';
import 'cap_request_list.dart';
import '../../../../widgets/error/error_widget.dart';
import '../../../../widgets/loading/loading_overlay.dart';
import '../../../../widgets/not_loggedin.dart';
import '../../../../widgets/slugs_drop_down.dart';

import '../../request_details_screen.dart';

class BookACarWrapper extends StatelessWidget {
  const BookACarWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: KNotLoggedInView(
        child: BlocProvider(
          create: (context) => Di.getInDriveBloc..get(),
          child: BlocBuilder<GetInDriveBloc, GetInDriveState>(
            builder: (context, state) {
              final trips = GetInDriveBloc.of(context).getInDriveModel;
              return state.when(
                loading: () => const KLoadingOverlay(isLoading: true),
                initial: () => const KLoadingOverlay(isLoading: true),
                success: () {
                  if (trips?.data?.isEmpty ?? false) {
                    return  BookACarView();
                  } else {
                    switch (trips?.data?.first.state) {
                      case KSlugModel.lookingForDriver:
                        return CapRequestList(model: trips?.data?.firstOrNull ?? TripModelData());
                      case (KSlugModel.waitingDriver):
                        return RequestDetailsScreen(model: trips?.data?.firstOrNull ?? TripModelData());
                      case (KSlugModel.waitingUser):
                        return RequestDetailsScreen(model: trips?.data?.firstOrNull ?? TripModelData());
                      case (KSlugModel.paymentNeeded):
                        return RequestDetailsScreen(model: trips?.data?.firstOrNull ?? TripModelData());
                      default:
                        return  BookACarView();
                    }
                  }
                },
                error: (error) => KErrorWidget(
                  error: state.whenOrNull(error: (error) => error),
                  isError: true,
                  onTryAgain: GetInDriveBloc.of(context).get,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
