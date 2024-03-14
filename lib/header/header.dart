import 'package:flutter/material.dart';
import 'package:enchanteddiary/help/help.dart';

class CustomHeader extends StatefulWidget implements PreferredSizeWidget {
  bool showBackButton;
  final Color appBarColor;
  Color _appBarColor = Colors.white;

  CustomHeader({this.appBarColor = Colors.white,this.showBackButton = true});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
class _CustomHeaderState extends State<CustomHeader>{
  final String title = "Enchanted Diary";

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
            'assets/images/EnchantedDiary.png', // Assurez-vous que le chemin vers votre logo est correct.
            height: 50,
            width: 50,// Ajustez la taille selon vos besoins.
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Ajustez selon vos besoins.
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.help_outline),
          onPressed: () {
            // Rediriger vers la page d'aide
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpPage()));}

     // Action pour le bouton d'aide.
        ),

      ],
      centerTitle: true,
    );
  }


}