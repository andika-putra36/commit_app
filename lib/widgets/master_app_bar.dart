import '../theme/app_color.dart';
import 'package:flutter/material.dart';

class MasterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MasterAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: AppColor.background,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// AppBar MasterAppBar() {
//   return AppBar(
//     title: Text("Commit"),
//     backgroundColor: AppColor.background,
//     centerTitle: true,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
//     ),
//   );
// }
