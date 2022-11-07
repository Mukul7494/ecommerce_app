import 'package:flutter/cupertino.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: banner.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  banner[index],
                  fit: BoxFit.contain,
                );
              }),
        ),
      ],
    );
  }
}

List<String> banner = [
  'assets/images/custom.jpg',
];
