import 'package:dating_cards/background.dart';
import 'package:dating_cards/cards_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFF0E0D0D),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/app_loc.svg',
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '목이길어슬픈기린님의 새로운 스팟',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Row(children: [
                          SvgPicture.asset('assets/images/pink_star.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '323,233',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Stack(
                          children: [
                            const Center(
                              child: Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Positioned(
                              left: 22,
                              top: 6,
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const BackgroundWidget(),
            Positioned(
                top: 0.0,
                left: MediaQuery.of(context).size.width * 0.1,
                child: const CardsStackWidget()),
          ],
        ),
        bottomSheet: BottomSheet(
            shape: Border.all(width: 0.0),
            elevation: 0.0,
            backgroundColor: Colors.black,
            onClosing: () {},
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.455 * MediaQuery.of(context).size.width,
                      top: 4,
                      child: Center(
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff3A3A3A), width: 2.0),
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0)),
                            border: Border.all(
                                color: const Color(0xff3A3A3A), width: 1.0)),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/home_svg.svg',
                              height: 40,
                              width: 40,
                            ),
                            SvgPicture.asset(
                              'assets/images/loc_svg.svg',
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Color(0xff0E0D0D),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/images/chat_svg.svg',
                              height: 40,
                              width: 40,
                            ),
                            SvgPicture.asset(
                              'assets/images/profile_svg.svg',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.455 * MediaQuery.of(context).size.width,
                      top: 5,
                      child: Center(
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SvgPicture.asset(
                              'assets/images/star_btn.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

enum Swipe { left, right, none }
