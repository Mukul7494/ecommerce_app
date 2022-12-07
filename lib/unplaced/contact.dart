import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Contact Us'),
      ),
      body: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              height: 225,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/contactus.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            const ListTile(
              title: Text(
                'SUPPORT',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.pin_drop),
              title: Text(
                'Shop With More Pvt ltd.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              '005,Building no.12-B,Sangeet complex,Ambala Cantt',
              textAlign: TextAlign.start,
            ),
            ListTile(
                leading: const Icon(Icons.whatsapp),
                title: Align(
                  // ignore: sort_child_properties_last
                  child: TextButton(
                    child: const Text('9350645254'),
                    // ignore: deprecated_member_use
                    onLongPress: () {
                      // ignore: deprecated_member_use
                      launch('sms:9306991070');
                    },
                    onPressed: () {
                      // ignore: deprecated_member_use
                      launch('tel:9034286092');
                    },
                  ),
                  alignment: Alignment(-1.2, 0),

                  //)
                )),
            ListTile(
              leading: const Icon(Icons.email),
              title: Align(
                // ignore: sort_child_properties_last
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'support@teamshopwithmore.com',
                  ),
                ),
                alignment: const Alignment(-1.2, 0),
              ),
            ),
            const ListTile(
              title: Text(
                'BRANCH OFFICE',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.pin_drop),
              title: Text(
                'Shop With More LLP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              '0001,Building no.12-B,Sangeet complex,Ambala Cantt',
              textAlign: TextAlign.start,
            ),
            ListTile(
                leading: const Icon(Icons.whatsapp),
                title: Align(
                  // ignore: sort_child_properties_last
                  child: TextButton(
                    child: const Text('9350645254'),
                    // ignore: deprecated_member_use
                    onLongPress: () {
                      // ignore: deprecated_member_use
                      launch('sms:9306991070');
                    },
                    onPressed: () {
                      // ignore: deprecated_member_use
                      launch('tel:9034286092');
                    },
                  ),
                  alignment: Alignment(-1.2, 0),

                  //)
                )),
            ListTile(
                leading: const Icon(Icons.email),
                title: Align(
                  // ignore: sort_child_properties_last
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'support@teamshopwithmore.com',
                    ),
                  ),
                  alignment: const Alignment(-1.2, 0),
                )),
            ListTile(
                leading: const Icon(Icons.email),
                title: Align(
                  // ignore: sort_child_properties_last
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'sales@teamshopwithmore.com',
                    ),
                  ),
                  alignment: const Alignment(-1.2, 0),
                ))
          ]),
        ],
      ),
    );
  }
}
