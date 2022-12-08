import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('AboutUs'),
      ),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Container(
            height: 225,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/aboutus.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          const ListTile(
            title: Text(
              'ABOUT US',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const ListTile(
            title: Text(
              'Welcome to ShopWithMore',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23),
            ),
          ),
          const ListTile(
            title: Text(
              'Feel The power of app creation',
              textAlign: TextAlign.start,
            ),
          ),
          const ListTile(
            title: Text(
                'We feel delighted to say that in these 7 years we have provided our services to more than 1 lakh customers across the country and still counting. All of our Lifetime Number are roaming free and portability enabled in any state of India.'),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: 120,
              width: 350,
              child: ListTile(
                title: LottieBuilder.asset(
                  'assets/lottie/number.json',
                  width: 350,
                  height: 95,
                ),
                subtitle: const Text(
                  ' + Happy customers',
                  textAlign: TextAlign.center,
                ),
              )),
          //),
          // ),
          const ListTile(
            title: Text('OUR MOTTO',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 25)),
          ),
          const ListTile(
            title: Text('Serving The Customers',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 21)),
          ),
          const ListTile(
            title: Text(
                'Our aim is to provide high quality services to everyone in India as we have earned our reputation because of our customers. They surely deserve best quality services and this is something which we had always believed in.'),
          ),
          const ListTile(
            title: Text('WHY CHOOSE US',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 25)),
          ),
          const ListTile(
            title: Text(
                "We are India's Largest App Provider at challenging prices that give our customers a huge amount of choices to choose their App According to their personal and business that helps in their growth.Now you can book  Easily Online with flutter app"),
          )
        ])
      ]),
    );
  }
}
