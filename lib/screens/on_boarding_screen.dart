import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/welcome_screen.dart';
import 'package:mabitt/utils/theme.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  late Timer _timer;

  // page related
  final PageController _controller = PageController(initialPage: 0);
  int pageIndex = 0;
  String titleText = "Start to invest\nfor your future!";

  // animation properties
  double animatedPositionWaveImageLeft = 40;

  // page change funciton
  updatePage(int nextIndex) {
    setState(() {
      pageIndex = nextIndex;

      if (nextIndex == 0) {
        titleText = "Find your home  \nwith  mabit application! ";
        animatedPositionWaveImageLeft = 40;
      } else if (nextIndex == 1) {
        titleText = "Keep your \ninvestments safe!";
        animatedPositionWaveImageLeft = -350;
      } else {
        titleText = "Start to search \nwith all specfication ";
        animatedPositionWaveImageLeft = -750;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int nextPageIndex = (_controller.page!.toInt() + 1) % 3;
      _controller.animateToPage(nextPageIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
      updatePage(nextPageIndex);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context related
    final ThemeData themeData = Theme.of(context);
    final Size ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // top dark mode and skip button
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                // width: ds.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: pageIndex != 2
                          ? GestureDetector(
                              onTap: () {},
                              // child: Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   // child: Text(
                              //   //   "Mabit",
                              //   //   style:
                              //   //       themeData.textTheme.titleMedium!.copyWith(
                              //   //     fontWeight: FontWeight.bold,
                              //   //   ),
                              //   // ),
                              // ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // background wave image
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            left: animatedPositionWaveImageLeft,
            child: Image.asset(
              'images/wh.png',
              fit: BoxFit.cover,
              // width: 3000,
            ),
          ),
          // vector image on center
          SizedBox(
            height: 600,
            child: PageView.custom(
              onPageChanged: (nextIndex) {
                updatePage(nextIndex);
              },
              controller: _controller,
              childrenDelegate: SliverChildBuilderDelegate(
                ((BuildContext context, int index) {
                  return AnimatedPadding(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                    padding: EdgeInsets.only(top: pageIndex == 1 ? 100 : 0),
                    child: Image.asset(
                      'images/on$index.png',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
                childCount: 3,
              ),
            ),
          ),

          // page indicators
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ds.height * 0.05,
              ),
              child: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      height: pageIndex == index ? 15 : 10,
                      width: pageIndex == index ? 25 : 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // titles
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            bottom: pageIndex == 1 ? ds.height / 1.4 : ds.height / 7,
            child: SizedBox(
              width: ds.width,
              child: Padding(
                padding: EdgeInsets.only(left: ds.width * 0.09),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  children: [
                    Text(
                      titleText,
                      style: themeData.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "",
                      style: themeData.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // start button
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: ds.width * 0.05,
                bottom: ds.height * 0.03,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: pageIndex == 2
                    ? FloatingActionButton(
                        backgroundColor: primary,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const WelcomeScreen()));
                        },
                        child: const Icon(CupertinoIcons.arrow_right),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
