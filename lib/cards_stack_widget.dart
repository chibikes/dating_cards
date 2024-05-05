import 'package:dating_cards/action_button_widget.dart';
import 'package:dating_cards/drag_widget.dart';
import 'package:dating_cards/main.dart';
import 'package:dating_cards/profile.dart';
import 'package:flutter/material.dart';

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key}) : super(key: key);

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget>
    with SingleTickerProviderStateMixin {
  List<Profile> draggableItems = [
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset: 'assets/images/picture_3.png',
        imgNumber: 0),
    const Profile(
      name: 'Rohini',
      distance: '10 miles away',
      imageAsset: 'assets/images/picture_2.png',
      imgNumber: 1,
    ),
    const Profile(
        name: 'Rohini',
        distance: '',
        imageAsset: 'assets/images/picture_1.png',
        imgNumber: 2),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;
  var _currentImage = 0;

  @override
  void initState() {
    _currentImage = draggableItems.length - 1;
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(draggableItems.length, (index) {
                if (index == draggableItems.length - 1) {
                  return PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          const Rect.fromLTWH(0, 0, 580, 340),
                          const Size(580, 340)),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                              swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -300
                                      : 300
                                  : 0,
                              0,
                              580,
                              340),
                          const Size(580, 340)),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    )),
                    child: RotationTransition(
                      turns: Tween<double>(
                              begin: 0,
                              end: swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -0.1 * 0.3
                                      : 0.1 * 0.3
                                  : 0.0)
                          .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve:
                              const Interval(0, 0.4, curve: Curves.easeInOut),
                        ),
                      ),
                      child: DragWidget(
                        imgLength: draggableItems.length,
                        profile: draggableItems[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                        isLastCard: true,
                        imgNo: _currentImage,
                      ),
                    ),
                  );
                } else {
                  return DragWidget(
                    imgLength: draggableItems.length,
                    profile: draggableItems[index],
                    index: index,
                    swipeNotifier: swipeNotifier,
                    imgNo: _currentImage,
                  );
                }
              }),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
        Row(
          children: [
            GestureDetector(
              // tap the left hand side shows previous which is next on the list (stack)
              onTap: () {
                if (_currentImage < draggableItems.length - 1) {
                  var item = const Profile(
                      name: '', distance: '', imageAsset: '', imgNumber: 0);
                  _currentImage++;
                  draggableItems.removeWhere((element) {
                    if (element.imgNumber == _currentImage) {
                      item = element;
                    }
                    return element.imgNumber == _currentImage;
                  });
                  setState(() {
                    draggableItems = [
                      ...draggableItems,
                      item,
                    ];
                  });
                }
              },
              child: Container(
                width: (0.80 * MediaQuery.of(context).size.width) / 2,
                height: (0.60 * MediaQuery.of(context).size.height) / 2,
                color: Colors.white.withOpacity(0.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_currentImage > 0) {
                  var item = const Profile(
                      name: '', distance: '', imageAsset: '', imgNumber: 0);
                  setState(() {
                    _currentImage--;
                    draggableItems.removeWhere((element) {
                      if (element.imgNumber == _currentImage) {
                        item = element;
                      }
                      return element.imgNumber == _currentImage;
                    });
                    draggableItems = [
                      ...draggableItems,
                      item,
                    ];
                  });
                }
              },
              child: Container(
                color: Colors.white.withOpacity(0.0),
                width: (0.80 * MediaQuery.of(context).size.width) / 2,
                height: (0.60 * MediaQuery.of(context).size.height) / 2,
              ),
            ),
          ],
        ),
        draggableItems.isEmpty
            ? Positioned(
                left: 0.0,
                top: 0.30 * MediaQuery.of(context).size.height,
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        '추천 드릴 친구들을 준비 중이에요',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        '매일 새로운 친구들을 소개시켜드려요',
                        style:
                            TextStyle(color: Color(0xFFADADAD), fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
