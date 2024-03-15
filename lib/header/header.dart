import 'package:flutter/material.dart';
import 'package:enchanteddiary/help/help.dart';

class CustomHeader extends StatefulWidget implements PreferredSizeWidget {
  bool showBackButton;
  final Color appBarColor;
  Color _appBarColor = Color(0xFF318fb5);

  CustomHeader({this.appBarColor = const Color(0xFF318fb5),this.showBackButton = true});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
class _CustomHeaderState extends State<CustomHeader>{
  final String title = "EnchantedDiary";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.appBarColor,
      leading: widget.showBackButton ? IconButton(
    icon: Icon(Icons.chevron_left),
    onPressed: () => Navigator.of(context).pop(),
    ) : null,
      toolbarHeight: 300,
      title: Column(
        children: [
          SizedBox(height: 10),
          Image.asset(
            'assets/images/EnchantedDiary.png',
            height: 50,
            width: 50,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF001244)),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.help_outline),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpPage()));}

        ),

      ],
      centerTitle: true,
    );
  }


}