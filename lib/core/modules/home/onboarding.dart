import 'package:ecomerce_app/core/modules/home/dash_board.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Widget _buildImage(String assetName, [double width = 300]) {
    return LottieBuilder.asset('assets/lottie/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntroductionScreen(
        key: introKey,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            title: 'Welcome TO ShopWithMo',
            body:
                'We are the only #1 Oldest, Trusted And Reputed Seller Across India With 13 Years Proven Track Record of providing Top-notch  services.',
            image: Center(
              child: LottieBuilder.asset(
                'assets/lottie/star.json',
              ),
            ),
          ),
          PageViewModel(
            title: 'Best In Class',
            body:
                "Our bussiness is one of the largest'Ecommerce' providers that's nothing short of making your communication special.",
            image: Center(
              child: LottieBuilder.asset(
                'assets/lottie/welcome.json',
              ),
            ),
          ),
          PageViewModel(
            title: '100% Genuine Products',
            body: 'Fast And Reliable Shipping World Wide',
            image: Center(
              child: LottieBuilder.asset(
                'assets/lottie/gen.json',
              ),
            ),
          )
        ],
        onDone: () {
          context.go('/home');
        },
        onSkip: () {
          context.go('/home');
        },
        // !(showBackButton && showSkipButton),
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done:
            const Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
