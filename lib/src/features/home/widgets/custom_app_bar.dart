import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import '../../../shared/resources/sizes.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/strings.dart';
import 'search_input.dart';

PreferredSize customAppBar(BuildContext context) {
  late List<Widget> tabs;
  final width = MediaQuery.of(context).size.width;
  final controller = context.watch<HomeController>();
  if (controller.tabState == TabState.success) {
    tabs = List.generate(controller.genresID.genres.length, (index) {
      return Tab(
        height: sizes.smallTextSize(context) * 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Text(controller.genresID.genres[index].name),
        ),
      );
    });
  }

  return PreferredSize(
    preferredSize: Size.fromHeight(sizes.appBarSize(context)),
    child: DefaultTabController(
      length: controller.tabState == TabState.success
          ? controller.genresID.genres.length
          : 0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 39,
            child: Container(
              color: Colours.white,
              height: 500,
              width: width,
            ),
          ),
          Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  child: Text(
                    Strings.title,
                    style: TextStyle(
                      fontSize: sizes.titleSize(context),
                      fontWeight: FontWeight.w600,
                      color: Colours.titleColor,
                    ),
                  ),
                ),
                const SearchInput(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: controller.tabState == TabState.loading
                      ? const SizedBox()
                      : TabBar(
                          isScrollable: true,
                          indicatorPadding: const EdgeInsets.only(right: 12),
                          labelPadding: const EdgeInsets.only(right: 12),
                          padding: EdgeInsets.zero,
                          unselectedLabelColor: Colours.detailsPrimaryColor,
                          labelColor: Colours.white,
                          labelStyle:
                              TextStyle(fontSize: sizes.smallTextSize(context)),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colours.detailsPrimaryColor,
                          ),
                          tabs: tabs,
                          onTap: (index) {
                            controller.loadContent(
                              id: controller.genresID.genres[index].id,
                            );
                          },
                        ),
                ),
                Container(
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colours.white, Colours.white.withOpacity(0.0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
