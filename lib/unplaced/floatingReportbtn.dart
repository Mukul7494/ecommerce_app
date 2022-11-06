import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FloatinReportBtn extends StatelessWidget {
  const FloatinReportBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
          child: const Icon(Icons.bug_report_sharp),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return
                      //  Form(
                      //   key: _formKey,
                      //   child:
                      AlertDialog(
                          title: const Text('Report Your issue'),
                          content: Builder(
                            builder: (context) {
                              var height = MediaQuery.of(context).size.height;
                              var width = MediaQuery.of(context).size.width;

                              return SizedBox(
                                  height: height - 450,
                                  width: width - 100,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '*Name',
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '*Email',
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        maxLines: 2,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          // prefixIcon: Icon(Icons.person),
                                          labelText: '*Message',
                                          hintText: '*What Happens',
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Submit sucessful')));
                                            Navigator.pop(context);
                                          },
                                          child: const ListTile(
                                            leading: Icon(
                                                Icons.fast_forward_rounded),
                                            title: Text('Submit'),
                                          ))
                                    ],
                                  ));
                            },
                          ));
                });
          }),
    );
  }
}
