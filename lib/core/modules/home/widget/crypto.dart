import 'package:flutter/material.dart';

class ImageItems {
  final String location;
  ImageItems({required this.location});
}

class Crypto extends StatelessWidget {
  Crypto({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  List<ImageItems> items = [
    ImageItems(
      location: 'assets/images/icon1.webp',
    ),
    ImageItems(
      location: 'assets/images/icon2.jpg',
    ),
    ImageItems(
      location: 'assets/images/icon3.png',
    ),
    ImageItems(
      location: 'assets/images/icon4.png',
    ),
    ImageItems(
      location: 'assets/images/icon5.png',
    ),
    ImageItems(
      location: 'assets/images/icon6.png',
    ),
    ImageItems(
      location: 'assets/images/icon1.webp',
    ),
    ImageItems(
      location: 'assets/images/icon2.jpg',
    ),
    ImageItems(
      location: 'assets/images/icon3.png',
    ),
    ImageItems(
      location: 'assets/images/icon4.png',
    ),
    ImageItems(
      location: 'assets/images/icon5.png',
    ),
    ImageItems(
      location: 'assets/images/icon6.png',
    ),
    ImageItems(
      location: 'assets/images/icon1.webp',
    ),
    ImageItems(
      location: 'assets/images/icon2.jpg',
    ),
    ImageItems(
      location: 'assets/images/icon3.png',
    ),
    ImageItems(
      location: 'assets/images/icon4.png',
    ),
    ImageItems(
      location: 'assets/images/icon5.png',
    ),
    ImageItems(
      location: 'assets/images/icon6.png',
    ),
    ImageItems(
      location: 'assets/images/icon1.webp',
    ),
    ImageItems(
      location: 'assets/images/icon2.jpg',
    ),
    ImageItems(
      location: 'assets/images/icon3.png',
    ),
    ImageItems(
      location: 'assets/images/icon4.png',
    ),
    ImageItems(
      location: 'assets/images/icon5.png',
    ),
    ImageItems(
      location: 'assets/images/icon6.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.06,
          left: screenSize.width / 15,
          right: screenSize.width / 15,
        ),
        child:
            //ResponsiveWidget.isSmallScreen(context)
            Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            const Text(
              'CRYPTO FRIENDLY TRAVEL BOOKING',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) =>
                        buildCard(items: items[index])),
                    separatorBuilder: (context, _) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: 23))
          ],
        )
        // : Row(
        //     //mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Row(),
        //       Column(
        //         children: const [
        //           Text(
        //             'Cryptocurrency Friendly Travel Booking',
        //             style: TextStyle(
        //               fontSize: 24,
        //               fontFamily: 'Montserrat',
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           SizedBox(
        //             width: 800,
        //             //height: screenSize.height / 12,

        //             child: Text(
        //                 'We pride ourselves on being the leading cryptocurrency friendly accommodation booking platform. Pay for your stay anywhere\n in the world seamlessly using your favourite cryptocurrency.'),
        //           ),
        //         ],
        //       ),
        //       // ListView.separated(
        //       //     scrollDirection: Axis.horizontal,
        //       //     itemBuilder: ((context, index) =>
        //       //         buildCard(items: items[index])),
        //       //     separatorBuilder: (context, _) => const SizedBox(
        //       //           width: 20,
        //       //         ),
        //       //     itemCount: 11),
        //     ],
        //   ),
        );
  }
}

Widget buildCard({required ImageItems items}) => CircleAvatar(
      backgroundImage: NetworkImage(items.location),
      // child:
      // Image.asset(items.location),
      radius: 30,
    );
