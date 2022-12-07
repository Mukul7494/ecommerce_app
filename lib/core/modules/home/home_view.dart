import 'package:ecomerce_app/core/modules/home/widget/slider.dart';
import 'package:ecomerce_app/core/modules/home/widget/sorting.dart';
import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../unplaced/floatingright.dart';
import '../products/products_list/products_grid.dart';
import 'widget/text_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const BannerView(),
            buildCustomText(),
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
            const PriceSort(),
            const ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
