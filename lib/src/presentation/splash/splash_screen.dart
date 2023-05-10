import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
        viewModel: SplashViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.init();
        },
        builder: (context, viewModel) {
          return Scaffold(
            body: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('app_name'.tr),
      ),
    );
  }
}
