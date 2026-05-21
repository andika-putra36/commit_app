import '../theme/app_color.dart';
import '../utils/app_size.dart';
import '../widgets/master_app_bar.dart';
import 'package:flutter/material.dart';

class MasterBasePage extends StatelessWidget {
  final String? appBarTitle;
  final Future<void> Function()? onRefresh;
  final Widget masterChild;
  final void Function()? floatingActionButton;
  final Widget? floatingActionButtonChild;
  final Widget? appBarChild;

  const MasterBasePage({
    super.key,
    this.appBarTitle,
    this.onRefresh,
    required this.masterChild,
    this.floatingActionButton,
    this.floatingActionButtonChild,
    this.appBarChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MasterAppBar(title: appBarTitle ?? '', child: appBarChild),
      body: RefreshIndicator(
        color: AppColor.background,
        backgroundColor: AppColor.textPrimary,
        onRefresh: () async {
          onRefresh?.call();
        },
        child: SizedBox(
          height: AppSize.bodyHeight(context),
          width: AppSize.screenWidth(context),
          // color: Colors.amber,
          // padding: EdgeInsets.all(20),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(
                  left: AppSize.screenWidth(context) / 10,
                  right: AppSize.screenWidth(context) / 10,
                  top: AppSize.screenWidth(context) / 15,
                  bottom: AppSize.screenWidth(context) / 15,
                ),
                child: masterChild,
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: floatingActionButton != null
          ? FloatingActionButton(
              onPressed: () {
                floatingActionButton?.call();
              },
              child: floatingActionButtonChild,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
