import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel elit nulla. Nam accumsan, est sed tempus aliquet, sapien velit ultrices velit, eget lacinia ex libero vel urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vestibulum vulputate magna a ullamcorper. In egestas mauris non nisi luctus, vel bibendum mi varius. Nulla facilisi. Aliquam ac posuere libero. Nulla sed urna vestibulum, cursus odio ac, efficitur ipsum. Integer bibendum, mauris sed finibus facilisis, lectus nisl ullamcorper nisi, non malesuada dolor elit at purus. Mauris ac sapien non sem egestas dictum. Donec nec venenatis lorem. Sed quis elit non mi vehicula sodales. Cras volutpat odio id lorem posuere venenatis. Nulla ut nulla semper, laoreet tellus non, rutrum nunc. Pellentesque eu eros id arcu finibus pellentesque ut sit amet sapien. Aliquam erat volutpat.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Collection of Personal Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel elit nulla. Nam accumsan, est sed tempus aliquet, sapien velit ultrices velit, eget lacinia ex libero vel urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vestibulum vulputate magna a ullamcorper. In egestas mauris non nisi luctus, vel bibendum mi varius. Nulla facilisi. Aliquam ac posuere libero. Nulla sed urna vestibulum, cursus odio ac, efficitur ipsum. Integer bibendum, mauris sed finibus facilisis, lectus nisl ullamcorper nisi, non malesuada dolor elit at purus. Mauris ac sapien non sem egestas dictum. Donec nec venenatis lorem. Sed quis elit non mi vehicula sodales. Cras volutpat odio id lorem posuere venenatis. Nulla ut nulla semper, laoreet tellus non, rutrum nunc. Pellentesque eu eros id arcu finibus pellentesque ut sit amet sapien. Aliquam erat volutpat.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Use of Personal Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel elit nulla. Nam accumsan, est sed tempus aliquet, sapien velit ultrices velit, eget lacinia ex libero vel urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vestibulum vulputate magna a ullamcorper. In egestas mauris non nisi luctus, vel bibendum mi varius. Nulla facilisi. Aliquam ac posuere libero. Nulla sed urna vestibulum, cursus odio ac, efficitur ipsum. Integer bibendum, mauris sed finibus facilisis, lectus nisl ullamcorper nisi, non malesuada dolor elit at purus. Mauris ac sapien non sem egestas dictum. Donec nec venenatis lorem. Sed quis elit non mi vehicula sodales. Cras volutpat odio id lorem posuere venenatis. Nulla ut nulla semper, laoreet tellus non, rutrum nunc. Pellentesque eu eros id arcu finibus pellentesque ut sit amet sapien. Aliquam erat volutpat.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
