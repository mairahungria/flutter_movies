import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/content_body.dart';
import 'widgets/custom_app_bar.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<HomeController>();
    controller.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        SafeArea(
          child: Scaffold(
            appBar: customAppBar(context),
            extendBodyBehindAppBar: true,
            body: const ContentBody(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}