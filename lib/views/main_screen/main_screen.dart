import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../cart/cart_screen.dart';
import '../favorites/favorite_screen.dart';
import '../home_screen/services_view.dart';
import '../home_screen/widgets/location_widget.dart';
import '../notifications/view/notifications_list.dart';
import '../widgets/appbar.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/not_loggedin.dart';
import '../../logic/main_view/main_view_bloc.dart';
import '../../packages/chat/view/conversation_list.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../profile/profile_screen.dart';
import '../widgets/action_dialog.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ActionDialog(
          title: Tr.get.exit_question,
          approveAction: Tr.get.yes_message,
          cancelAction: Tr.get.no_message,
          onApproveClick: () {
            Navigator.pop(context);
            SystemNavigator.pop();
          },
          onCancelClick: () {
            Navigator.pop(context);
          },
        ).show<void>(context);
        return false;
      },
      child: BlocProvider(
        create: (context) => MainViewBloc(),
        child: BlocBuilder<MainViewBloc, MainViewState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              extendBody: true,
              appBar: (state.index != 4)
                  ? KAppBar(
                      home: state.index == 4 ? true : false,
                      title: MainViewBloc.of(context).labels[state.index],
                      titleWidget: KStorage.i.getUserInfo?.data != null ? const LocationWidget() : null,
                      showCart: false,
                    )
                  : null,
              body: BgImg(
                child: PageView(
                  controller: MainViewBloc.of(context).pageCtrl,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    KNotLoggedInView(child: FavoriteScreen()),
                    KNotLoggedInView(child: ConversationView()),
                    KNotLoggedInView(child: CartScreen(showAppBar: false)),
                    KNotLoggedInView(child: ProfileScreen()),
                    ServicesView(),
                    NotificationsList(),
                  ],
                ),
              ),
              floatingActionButton: SizedBox(
                width: 45,
                child: FloatingActionButton(
                  onPressed: () {
                    MainViewBloc.of(context).navTaped(4);
                  },
                  backgroundColor: KColors.of(context).fabBackground,
                  child: const Icon(KHelper.home, color: Colors.white),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                height: 50,
                icons: MainViewBloc.of(context).navItems,
                activeIndex: state.index,
                shadow: Shadow(color: KColors.of(context).shadow, blurRadius: 10),
                backgroundColor: KColors.of(context).elevatedBox,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.sharpEdge,
                onTap: MainViewBloc.of(context).navTaped,
                activeColor: KColors.of(context).selected,
                inactiveColor: KColors.of(context).activeIcons,
                blurEffect: false,
              ),
            );
          },
        ),
      ),
    );
    // }
  }
}




