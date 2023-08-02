import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart';
import 'logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'logic/nav_enforcer/nav_enforcer_state.dart';
import 'logic/theme/theme_cubit.dart';
import 'packages/cache/locale_storage.dart';
import 'packages/shared/error/failures.dart';
import 'shared/localization/trans.dart';
import 'shared/theme/helper.dart';
import 'shared/theme/theme_data.dart';
import 'views/Auth/login/login_screen.dart';
import 'views/Auth/pin_code/pin_code_screen.dart';
import 'views/main_screen/main_screen.dart';
import 'views/onboarding_screen/choose_lang_screen.dart';
import 'views/splash_screen/splash_screen.dart';
import 'views/widgets/loading/loading_overlay.dart';
import 'views/widgets/on_success_view.dart';
import 'packages/shared/picker/logic/location_cubit/location_cubit.dart';
import 'package:get/get.dart';


import 'views/widgets/error/error_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.themeBloc..loadTheme()),
        BlocProvider(create: (context) => Di.languagesBloc..getAllLangs()),
        BlocProvider(create: (context) => Di.navEnforcerBloc),
        BlocProvider(create: (context) => Di.apiClientBloc),
        BlocProvider(create: (context) => Di.settingsBloc..getSettings()),
        BlocProvider(create: (context) => Di.currenciesBloc..getCurrencies()),
        BlocProvider(create: (context) => Di.locationBloc..getCountries()),
        BlocProvider(create: (context) => Di.userInfoBloc),
        BlocProvider(create: (context) => Di.logoutBloc),
        BlocProvider(create: (context) => Di.servicesBloc..getServices(), lazy: true),
        BlocProvider(create: (context) => Di.favoriteBloc..get(false)),
        BlocProvider(create: (context) => Di.cartBloc..get_cart(isLoading: true)),
        BlocProvider(create: (context) => Di.chatBloc..get_all_rooms()),
        BlocProvider(create: (context) => Di.addressesBloc..getAddress()),
        BlocProvider(create: (context) => Di.myPaymentsBloc..getMyPayments()),
        BlocProvider(create: (context) => Di.getPaymentTypeBloc..gettypes()),
        BlocProvider(create: (context) => Di.getReportsBloc..get()),
        BlocProvider(create: (context) => Di.inDriverPayment),
        BlocProvider(create: (context) => Di.findDriverBloc..init_socket()),
        BlocProvider(create: (context) => Di.updateTripCubit),
        BlocProvider(create: (context) => Di.getRequestQuoteBloc..get()),
        BlocProvider(create: (context) => Di.getColor..getColor()),
        BlocProvider(create: (context) => GetLocationCubit()..initLocation()),
        // BlocProvider(create: (context) => DetailsCubit()),
        BlocProvider(
          create: (context) => Di.getOrderBloc
            ..getOrder()
            ..init_socket(),
        ),
        BlocProvider(create: (context) => Di.deliveringPaymentCubit),
        BlocProvider(
          create: (context) => Di.getDeliveringOrderBloc
            ..getDeliveringOrders()
            ..init_delivering_socket(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocListener<ApiClientBloc, ApiClientState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (failure) {
                  KHelper.showSnackBar(KFailure.toError(failure));
                  failure.whenOrNull(
                    error409: () {
                      Get.offAll(() => PinCodeScreen(destination: const MainNavigationView(), msg: Tr.get.not_verfied));
                    },
                    error401: () {
                      if (KStorage.i.getToken != null) {
                        KStorage.i.delToken;
                        KStorage.i.delUserInfo;
                        Get.offAll(() => const LoginScreen());
                      }
                    },
                  );
                },
              );
            },
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: BlocListener<NavEnforcerBloc, NavEnforcerState>(
                listener: (context, nav) {
                  nav.when(
                    loading: () {
                      Get.offAll(() => const Scaffold(body: KLoadingOverlay(isLoading: true)));
                    },
                    toSuccess: (msg, destination) {
                      if (msg != null) {
                        Get.offAll(() => OnSuccessView(msg: msg, destination: destination));
                      } else {
                        Get.offAll(() => destination);
                      }
                    },
                    error: (msg) {
                      Get.offAll(
                        () => KErrorView(
                          error: msg,
                          onTryAgain: () {
                            Get.offAll(() => const Wrapper());
                            Di.reset(context);
                          },
                        ),
                      );
                    },
                  );
                },
                child: GetMaterialApp(
                  title: 'FORALL',
                  navigatorKey: Nav.navigator,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: Tr.delegates,
                  supportedLocales: Tr.supportedLocales,
                  locale: ThemeBloc.of(context).locale,
                  localeResolutionCallback: (Locale? locale, Iterable<Locale> iterable) {
                    return ThemeBloc.of(context).locale;
                  },
                  theme: KThemeData.light,
                  darkTheme: KThemeData.dark,
                  themeMode: ThemeBloc.of(context).themeMode,
                  home: Builder(
                    builder: (context) {
                      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
                      return AnnotatedRegion<SystemUiOverlayStyle>(
                        value: KThemeData.of(context).overlayStyle,
                        child: const SplashScreen(),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => nav());
  }

  nav() {
    if (KStorage.i.getLang == null || KStorage.i.getCurrency == null) {
      return Get.offAll(() => const ChooseLangScreen());
    } else {
      return Get.offAll(() => const MainNavigationView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
