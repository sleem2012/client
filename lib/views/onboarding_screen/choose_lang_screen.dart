import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/global/currencies/currencies_bloc.dart';
import '../../logic/global/languages/langugese_bloc.dart';
import '../../logic/theme/theme_cubit.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import 'on_boarding_screen.dart';
import '../widgets/currency_drop.dart';
import '../widgets/lang_dropdown.dart';
import 'package:get/get.dart';

import '../../logic/global/settings/settings_bloc.dart';

class ChooseLangScreen extends StatelessWidget {
  const ChooseLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 16.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/on_boarding_3.svg",
                width: Get.width,
              ),
              Text(
                Tr.get.started,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: KColors.of(context).accentColor,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 30),
              LanguageDropdown(
                onSelect: (val) {
                  LanguagesBloc.of(context).selectLang(val!);

                  ThemeBloc.of(context).updateLocale(val.symbols);

                  CurrenciesBloc.of(context).getCurrencies();
                  // LanguagesBloc.of(context).getAllLangs();

                },
              ),
              const SizedBox(height: 20),
              CurrenciesDropdown(
                onSelect: (val) {
                  CurrenciesBloc.of(context).selectCurrency(val!);
                },
              ),


              const SizedBox(height: 30),
              Builder(builder: (context) {
                return TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(0, 0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(KColors.of(context).accentColor),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10.0)),
                  ),
                  onPressed: () {
                    if (LanguagesBloc.of(context).seletedLang != null && CurrenciesBloc.of(context).selectedCurrency != null) {
                      ThemeBloc.of(context).updateLocale(LanguagesBloc.of(context).seletedLang?.symbols);
                      SettingsBloc.of(context).getSettings();

                      // Get.offAll(() => const );
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OnBoarding()), (route) => false);
                    } else {
                      KHelper.showSnackBar(Tr.get.lang_validation);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 25.0,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
