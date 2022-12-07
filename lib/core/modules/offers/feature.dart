import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../../theme/components/components.dart';

class Featured extends StatelessWidget {
  Featured({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 182, 210, 224),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenSize.height / 2,
            width: screenSize.width / 3.8,
            child: ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text("24/7 Customer Support",
                        style: headlineSecondaryTextStyle,
                        textAlign: TextAlign.center),
                  ),
                  Text(
                      "Do you need help or have a question? Contact our proactive 24/7 customer support team via live chat, email, hotline or online ticket system.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 2,
            width: screenSize.width / 3.8,
            child: ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text("Competitive Pricing",
                        style: headlineSecondaryTextStyle,
                        textAlign: TextAlign.center),
                  ),
                  Text(
                      "With access to unique tours and experiences, you benefit from extremely competitive pricing on 410,000+ activities worldwide.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 2,
            width: screenSize.width / 3.8,
            child: ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text("Multi-Payment Options",
                        style: headlineSecondaryTextStyle,
                        textAlign: TextAlign.center),
                  ),
                  Text(
                      "We offer various payment methods to make a booking with us. Choose from Credit and Debit Cards, and the leading Cryptocurrencies.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
