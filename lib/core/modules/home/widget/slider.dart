import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class BannerView extends StatelessWidget {
//   const BannerView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//               itemCount: banner.length,
//               itemBuilder: (context, index) {
//                 return Image.asset(
//                   banner[index],
//                   fit: BoxFit.contain,
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }

// List<String> banner = [
//   'assets/images/custom.jpg',
// ];

class BannerView extends StatefulWidget {
  const BannerView({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    'assets/images/custom.jpg',
    'assets/images/custom.jpg',
    'assets/images/custom.jpg',
    // 'assets/images/qw4.png',
  ];
  final List<String> assets = [
    'assets/images/custom.jpg',
    'assets/images/custom.jpg',
    'assets/images/custom.jpg',
    // 'assets/images/qw4.png',
  ];

  final List<String> title = [
    'b1',
    'b2',
    'b3',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                // height: 1000,
                // width: 1500,
                height: widget.screenSize.height / 4,
                width: widget.screenSize.width / 1.03,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index % images.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        images[index % images.length],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < images.length; i++)
                    buildIndicator(currentIndex == i)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildIndicator(bool isSelected) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Container(
      height: isSelected ? 12 : 10,
      width: isSelected ? 12 : 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    ),
  );
}
