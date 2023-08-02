import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../main_screen/main_screen.dart';
import '../widgets/action_dialog.dart';
import 'widgets/slide_dotes.dart';
import 'widgets/slide_items.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final key = GlobalKey<SlideItemsState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        switch (_currentPage) {
          case 0:
            ActionDialog(
              content: [
                Text(
                  Tr.get.exit_question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
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

          case 1:
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
            break;
          case 2:
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    _currentPage = index;
                    setState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: 1,
                  itemBuilder: (context, i) => SlideItems(i, key: i == 2 ? key : null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          1,
                          (i) => i == _currentPage ? const SlideDotes(true) : const SlideDotes(false),
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(const Size(0, 0)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                        backgroundColor: MaterialStateProperty.all<Color>(KColors.of(context).accentColor),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10.0)),
                      ),
                      onPressed: () async {
                        // if (_currentPage == 1) {
                          Get.offAll(() => const MainNavigationView());
                        // } else {
                        //   _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOutCubic);
                        // }
                      },
                      child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
