import 'package:flutter/material.dart';

import '../../../../theme/widgets/bootom_bqat_column.dart';
import 'info_text.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //     padding: const EdgeInsets.all(30),
    //     color: const Color.fromARGB(255, 10, 2, 87),
    //     child: Column(
    //       children: [
    //         const Align(
    //           alignment: Alignment.topLeft,
    //           child: Text(
    //             'ShopWithMore.com',
    //             style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 5,
    //         ),
    //         Align(
    //           alignment: Alignment.topLeft,
    //           child: SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.55,
    //             child: const Text(
    //               'We accept Credit Card, Debit Card and Cryptocurrency payments.',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         Row(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             SizedBox(
    //               width: MediaQuery.of(context).size.width * 0.86,
    //               child: Column(
    //                 children: const [
    //                   Divider(
    //                     color: Colors.grey,
    //                   ),
    //                   ExpansionTile(
    //                     title: Text(
    //                       'ShopWithMore.COM',
    //                       style: TextStyle(color: Colors.white, fontSize: 15),
    //                     ),
    //                     children: [
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('About Us')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('AVA Token')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Smart Program')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Invite Program')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Affiliate Program')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Shop Credits')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Shop Gift Cards')),
    //                     ],
    //                   ),
    //                   Divider(
    //                     color: Colors.grey,
    //                   ),
    //                   ExpansionTile(
    //                     title: Text(
    //                       'SUPPORT',
    //                       style: TextStyle(color: Colors.white, fontSize: 15),
    //                     ),
    //                     children: [
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Help Centre')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('My Shop')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Help Centre')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Concierge')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Contact us')),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Help Centre')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Partnership')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Privacy Policy')),
    //                     ],
    //                   ),
    //                   Divider(
    //                     color: Colors.grey,
    //                   ),
    //                   ExpansionTile(
    //                     title: Text(
    //                       'USEFUL LINKS',
    //                       style: TextStyle(color: Colors.white, fontSize: 15),
    //                     ),
    //                     children: [
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Mobile App')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Business Travel')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Payment Options')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Binance Travel')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Partner Network')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Bug Report')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                     ],
    //                   ),
    //                   Divider(
    //                     color: Colors.grey,
    //                   ),
    //                   ExpansionTile(
    //                     title: Text(
    //                       'RESOURCES',
    //                       style: TextStyle(color: Colors.white, fontSize: 15),
    //                     ),
    //                     children: [
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Official Blog')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Our Partners')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Travel Advices')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Travel Guides')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Align(
    //                           alignment: Alignment.topLeft,
    //                           child: Text('Coin Listing')),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                     ],
    //                   ),
    //                   Divider(
    //                     color: Colors.grey,
    //                   ),
    //                   ExpansionTile(
    //                     title: Text(
    //                       'COMMUNITY',
    //                       style: TextStyle(color: Colors.white, fontSize: 15),
    //                     ),
    //                     children: [
    //                       Text(''),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //         Container(
    //           color: Colors.blueGrey,
    //           width: double.maxFinite,
    //           height: 1,
    //         ),
    //         const SizedBox(height: 20),
    //         InfoText(
    //           type: 'Email',
    //           text: 'Shop@gmail.com',
    //         ),
    //         const SizedBox(height: 5),
    //         InfoText(
    //           type: 'Address',
    //           text: '128, Trymore Road, Delft, MN - 56124',
    //         ),
    //         const SizedBox(height: 20),
    //         Container(
    //           color: Colors.blueGrey,
    //           width: double.maxFinite,
    //           height: 1,
    //         ),
    //         const SizedBox(height: 20),
    //         Text(
    //           'Copyright © 2022 | ShopWihMore',
    //           style: TextStyle(
    //             color: Colors.blueGrey[300],
    //             fontSize: 14,
    //           ),
    //         ),
    //       ],
    //     )
    return Container(
        padding: EdgeInsets.all(30),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarColumn(
                  heading: 'ABOUT',
                  s1: 'Contact Us',
                  s2: 'About Us',
                  s3: 'Careers',
                ),
                BottomBarColumn(
                  heading: 'HELP',
                  s1: 'Payment',
                  s2: 'Cancellation',
                  s3: 'FAQ',
                ),
                BottomBarColumn(
                  heading: 'SOCIAL',
                  s1: 'Twitter',
                  s2: 'Facebook',
                  s3: 'YouTube',
                ),
              ],
            ),
            Container(
              color: Color.fromARGB(255, 206, 225, 235),
              width: double.maxFinite,
              height: 1,
            ),
            SizedBox(height: 20),
            InfoText(
              type: 'Email',
              text: 'support@MyShop.com',
            ),
            SizedBox(height: 5),
            InfoText(
              type: 'Address',
              text: '128, Trymore Road, Delft, MN - 56124',
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
            SizedBox(height: 20),
            Text(
              'Copyright © 2022 | ACE Ambala',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ));
  }
}
