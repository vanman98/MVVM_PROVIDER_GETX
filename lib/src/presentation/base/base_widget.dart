import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../presentation.dart';
import 'base_viewmodel.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  /*
    child, childDesktop, childMobile, childTablet:
    Its widget not listen on consumer
    Use to paint to widget not change(Appbar, background....)
   */
  final Widget Function(BuildContext context, T viewModel)
      builder;
  final T viewModel;
  final Function(T viewModel)? onViewModelReady;

  BaseWidget({
    Key? key,
    required this.builder,
    required this.viewModel,
    this.onViewModelReady,
  }) : super(key: key) {
    Get.put(viewModel);
  }

  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  T? viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    if (widget.onViewModelReady != null) {
      widget.onViewModelReady!(viewModel!);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<T>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel!..setContext(context),
      child: Consumer<T>(
        builder: (_, viewModel, child) => WidgetLoadingFullScreen(
          loading: viewModel.loadingSubject,
          child: widget.builder(_, viewModel),
        ),
      ),
    );
  }
}
