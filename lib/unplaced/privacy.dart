import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text('Privacy Policy'),
        ),
        body: ListView(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const Text(
                    'PRIVACY POLICY',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  gapH16,
                  Text.rich(TextSpan(
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      children: [
                        const TextSpan(
                            text:
                                "We value the trust you place in us and recognize the importance of secure transactions and information privacy. This Privacy Policy describes how ShopWithMore Internet Private Limited and its affiliates (collectively “SWM, we, our, us”) collect, use, share or otherwise process your personal information through SWM website "),
                        TextSpan(
                            style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                            //make link blue and underline
                            text: "www.ShopWithMore.com",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String url = "https://qr.page/g/2tK5eGOyxyC";
                                // ignore: deprecated_member_use
                                var urllaunchable = await launch(
                                    url); //canLaunch is from url_launcher package
                                if (urllaunchable) {
                                  // ignore: deprecated_member_use
                                  await launch(
                                      url); //launch is from url_launcher package to launch URL
                                } else {
                                  print("URL can't be launched.");
                                }
                              }),
                        const TextSpan(
                            text:
                                " its mobile application\n While you may be able to browse certain sections of the Platform without registering with us, however, please note we do not offer any product or service under this Platform outside India. Your personal information will primarily be stored and processed in India and may have data protection laws that are different from those that apply in the country in which you are located. By visiting this Platform, providing your information or availing out product/service, you expressly agree to be bound by the terms and conditions of this Privacy Policy, the Terms of Use and the applicable service/product terms and conditions, and agree to be governed by the laws of India including but not limited to the laws applicable to data protection and privacy. If you do not agree please do not use or access our Platform."),
                      ])),
                ])),
          ],
        ));
  }
}
