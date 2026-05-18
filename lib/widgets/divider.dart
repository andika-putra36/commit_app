import '../utils/app_size.dart';
import 'package:flutter/widgets.dart';

class CleanDivider extends StatelessWidget {
  const CleanDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppSize.screenHeight(context) / 30);
  }
}

class CleanDividerSmall extends StatelessWidget {
  const CleanDividerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppSize.screenHeight(context) / 50);
  }
}
