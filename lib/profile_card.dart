import 'package:dating_cards/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard(
      {Key? key,
      required this.profile,
      required this.imgNo,
      required this.imgLength})
      : super(key: key);
  final Profile profile;
  final int imgNo;
  final int imgLength;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late double conHeight;
  late double conWidth;
  double conRadius = 24.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    conHeight = 0.80 * MediaQuery.of(context).size.height;
    conWidth = 0.80 * MediaQuery.of(context).size.width;
    return Container(
      height: conHeight,
      width: conWidth,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.profile.imageAsset,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
              top: 16,
              left: 8,
              child: getImages(widget.imgLength, (0.90 * conWidth).toInt())),
          Positioned(
              bottom: 0,
              child: Container(
                height: conHeight,
                width: conWidth,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.0, color: Colors.transparent),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.7,
                        0.85,
                        0.97,
                        1.0
                      ],
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black54,
                        Colors.black87
                      ]),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.amber,
                ),
              )),
          Positioned(
              right: 20,
              bottom: 70,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF45FFF4),
                  ),
                ),
                height: 42,
                width: 42,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/images/purple_heart.svg',
                      height: 15,
                      width: 15,
                    )),
              )),
          Positioned(
              left: 20,
              bottom: 70,
              child: about.reversed.toList()[widget.imgNo])
        ],
      ),
    );
  }

  List<Widget> about = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            color: Colors.black,
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/pink_star.svg',
                    color: const Color(0xff3A3A3A),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '29,930',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
        const Text(
          '잭과분홍콩나물 25',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '서울 . 2km 거리에 있음',
          style: TextStyle(color: Color(0xFFD9D9D9)),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            color: Colors.black,
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/pink_star.svg',
                    color: const Color(0xff3A3A3A),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '29,930',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
        const Text(
          '잭과분홍콩나물 25',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '서로 아껴주고 힘이 되어줄 사람 찾아요',
          style: TextStyle(color: Color(0xFFD9D9D9)),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text(
          '선릉으로 직장 다니고 있고 여행 좋아해요',
          style: TextStyle(color: Color(0xFFD9D9D9)),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text(
          '이상한 이야기하시는 분 바로 차단입니다',
          style: TextStyle(color: Color(0XFFD9D9D9)),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            color: Colors.black,
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/pink_star.svg',
                    color: const Color(0xff3A3A3A),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '29,930',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '잭과분홍콩나물 25',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFfFF006B)),
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            color: const Color(0xFFFF006B).withOpacity(0.25),
          ),
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '💖 진지한 연애를 찾는 중',
                    style: TextStyle(color: Color(0xFFFF006B)),
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Row(
          children: [
            GenericContainer(text: '🍸 전혀 안 함'),
            SizedBox(
              width: 5.0,
            ),
            GenericContainer(text: '🚬 비흡연'),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const GenericContainer(text: '💪🏻 매일 1시간 이상'),
        const SizedBox(
          height: 8.0,
        ),
        const Row(
          children: [
            GenericContainer(text: '🤝 만나는 걸 좋아함'),
            SizedBox(
              width: 5.0,
            ),
            GenericContainer(text: 'INFP')
          ],
        )
      ],
    )
  ];

  Widget getImages(int images, int maxWidth) {
    var list = List<Widget>.generate(
        images,
        (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  gradient: index == widget.imgNo
                      ? const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFFF006B), Color(0xFFFF4593)],
                          stops: [0.8, 1.0])
                      : const LinearGradient(
                          colors: [Color(0xFF202020), Color(0xFF202020)]),
                ),
                height: 5,
                width: maxWidth / images,
              ),
            ));
    return Row(
      children: list.reversed.toList(),
    );
  }
}

class GenericContainer extends StatelessWidget {
  const GenericContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 2.0,
              color: const Color(0xff3A3A3A),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(24.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
