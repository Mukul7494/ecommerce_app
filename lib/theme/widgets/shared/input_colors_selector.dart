import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';

class InputColorsSelector extends StatefulWidget {
  const InputColorsSelector({
    Key? key,
    required this.controller,
    required this.isPhone,
  }) : super(key: key);

  final ThemeController controller;
  final bool isPhone;

  @override
  _InputColorsSelectorState createState() => _InputColorsSelectorState();
}

class _InputColorsSelectorState extends State<InputColorsSelector> {
  late final ScrollController scrollController;
  late int schemeIndex;

  // The fixed width the scrolling button at desktop size.
  static const double _kWidthOfScrollItem = 67.2;
  // The fixed height of the scrolling button at desktop size.
  static const double _kHeightOfScrollItem = 66;

  @override
  void initState() {
    super.initState();
    schemeIndex = widget.controller.schemeIndex;
    final double phoneReduce =
    widget.isPhone ? AppData.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce = widget.isPhone ? -3 : 0;
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset:
      (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
          schemeIndex,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.controller.schemeIndex != schemeIndex) {
      final double phoneReduce =
      widget.isPhone ? AppData.colorButtonPhoneReduce : 0;
      final double phoneButtonsSpacingReduce = widget.isPhone ? -3 : 0;
      schemeIndex = widget.controller.schemeIndex;
      scrollController.jumpTo(
          (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
              schemeIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final double phoneReduce =
    widget.isPhone ? AppData.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce = widget.isPhone ? -3 : 0;
    return SizedBox(
      height: _kHeightOfScrollItem + phoneReduce,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AppColor.schemes.length,
              itemBuilder: (BuildContext context, int index) {
                return FlexThemeModeOptionButton(
                  optionButtonPadding: EdgeInsetsDirectional.only(
                      start: 6 + phoneButtonsSpacingReduce),
                  optionButtonBorderRadius: widget.controller.useSubThemes &&
                      widget.controller.useFlexColorScheme
                  // M3 default for Card is 12.
                      ? (widget.controller.cardBorderRadius ??
                      widget.controller.defaultRadius ??
                      12)
                  // M2 default for Card.
                      : 4,
                  height: 30 + phoneReduce / 2,
                  width: 30 + phoneReduce / 2,
                  padding: const EdgeInsets.all(0.3),
                  optionButtonMargin: EdgeInsets.zero,
                  borderRadius: 0,
                  unselectedBorder: BorderSide.none,
                  selectedBorder: BorderSide(
                    color: Theme.of(context).primaryColorLight,
                    width: 4,
                  ),
                  onSelect: () {
                    scrollController.animateTo(
                        (_kWidthOfScrollItem +
                            phoneReduce +
                            phoneButtonsSpacingReduce) *
                            index,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic);
                    schemeIndex = index;
                    widget.controller.setSchemeIndex(index);
                  },
                  selected: widget.controller.schemeIndex == index,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexSchemeColor: isLight
                      ? AppColor.schemeAtIndex(index, widget.controller).light
                      : AppColor.schemeAtIndex(index, widget.controller).dark,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
