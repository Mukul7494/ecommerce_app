import 'package:ecomerce_app/core/modules/home/slider.dart';
import 'package:ecomerce_app/core/modules/home/sorting.dart';
import 'package:ecomerce_app/core/modules/home/speed_dial.dart';
import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const BannerView(),
            Hero(
              tag: 'search',
              child: Card(
                child: ListTile(
                  title: FormBuilderTextField(
                    name: "search",
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: false,
                    ),
                    autofocus: false,
                  ),
                  trailing: const Icon(EvaIcons.search),
                ),
              ),
            ),
            Text('Shop Between 1000 of Product',
                style: Theme.of(context).textTheme.headline4),
            const PriceSort(),
            LottieBuilder.asset(
              'assets/lottie/nodata.json',
              repeat: false,
              fit: BoxFit.contain,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            gapH4,
            const Text(
              'No Product available',
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
