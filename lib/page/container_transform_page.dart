import 'package:animations/animations.dart';
import 'package:animations_transform_example/main.dart';
import 'package:animations_transform_example/widget/card_widget.dart';
import 'package:animations_transform_example/widget/custom_fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'details_page.dart';

class ContainerTransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transitionType = ContainerTransitionType.fade;

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 10,
        staggeredTileBuilder: (index) {
          final crossAxisCount = 2;
          final mainAxisCount = index.isEven ? 3 : 2;

          return StaggeredTile.count(crossAxisCount, mainAxisCount);
        },
        itemBuilder: (context, index) => OpenContainer(
          transitionType: transitionType,
          transitionDuration: Duration(seconds: 3),
          openBuilder: (context, _) => DetailsPage(index: index),
          closedBuilder: (context, VoidCallback openContainer) => CardWidget(
            index: index,
            onClicked: openContainer,
          ),
        ),
      ),
      floatingActionButton: CustomFABWidget(transitionType: transitionType),
    );
  }
}
