import 'package:flutter/material.dart';
import '../../configs/configs.dart';
import '../presentation.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late NavigationViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NavigationViewModel>(
        viewModel: NavigationViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel..init();
        },
        builder: (context, viewModel) {
          return Scaffold(
            body: Column(
              children: [],
            ),
          );
        });
  }
}
