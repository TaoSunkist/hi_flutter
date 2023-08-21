import 'package:flutter/material.dart';

import '../../util/color.dart';


class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final String leftTitle;

  final String rightTitle;

  final VoidCallback onBackPressCallback;

  const GradientAppBar(
      {super.key, required this.title, this.leftTitle = "", this.rightTitle = "", required this.onBackPressCallback});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(color: materialColors.shade50),
      ),
      iconTheme: Theme.of(context).iconTheme,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [materialColors.shade500, materialColors.shade900],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
      ),
      leading: InkWell(onTap: onBackPressCallback, child: Icon(Icons.arrow_back)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
