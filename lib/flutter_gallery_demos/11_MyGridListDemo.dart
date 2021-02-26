// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

class MyGridListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('MyPersistentBottomSheetDemo'),),
        body: ListView(
          children: [
            Container(width:500,height:500,child: GridListDemo(type: GridListDemoType.imageOnly,),),
            Container(width:500,height:500,child: GridListDemo(type: GridListDemoType.header,),),
            Container(width:500,height:500,child: GridListDemo(type: GridListDemoType.footer,),),
          ],
        ),
      ),
    );
  }
}

/*----------------------------------------------------------------------------------------*/

enum GridListDemoType {
  imageOnly,
  header,
  footer,
}

class GridListDemo extends StatelessWidget {
  const GridListDemo({Key key, this.type}) : super(key: key);

  final GridListDemoType type;

  List<_Photo> _photos(BuildContext context) {
    return [
      _Photo(
        assetName: 'assets/1.jpg',
        title: 'placeChennai',
        subtitle: 'placeFlowerMarket',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeTanjore',
        subtitle: 'placeBronzeWorks',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeTanjore',
        subtitle: 'placeMarket',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeTanjore',
        subtitle: 'placeThanjavurTemple',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeTanjore',
        subtitle: 'placeThanjavurTemple',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placePondicherry',
        subtitle: 'placeSaltFarm',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeChennai',
        subtitle: 'placeScooters',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeChettinad',
        subtitle: 'placeSilkMaker',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeChettinad',
        subtitle: 'placeLunchPrep',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placeTanjore',
        subtitle: 'placeMarket',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placePondicherry',
        subtitle: 'placeBeach',
      ),
      _Photo(
        assetName: 'assets/2.jpg',
        title: 'placePondicherry',
        subtitle: 'placeFisherman',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('demoGridListsTitle'),
      ),
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: _photos(context).map<Widget>((photo) {
          return _GridDemoPhotoItem(
            photo: photo,
            tileStyle: type,
          );
        }).toList(),
      ),
    );
  }
}

class _Photo {
  _Photo({
    this.assetName,
    this.title,
    this.subtitle,
  });

  final String assetName;
  final String title;
  final String subtitle;
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({
    Key key,
    @required this.photo,
    @required this.tileStyle,
  }) : super(key: key);

  final _Photo photo;
  final GridListDemoType tileStyle;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        photo.assetName,
        fit: BoxFit.cover,
      ),
    );

    switch (tileStyle) {
      case GridListDemoType.imageOnly:
        return image;
      case GridListDemoType.header:
        return GridTile(
          header: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              title: _GridTitleText(photo.title),
              backgroundColor: Colors.black45,
            ),
          ),
          child: image,
        );
      case GridListDemoType.footer:
        return GridTile(
          footer: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: _GridTitleText(photo.title),
              subtitle: _GridTitleText(photo.subtitle),
            ),
          ),
          child: image,
        );
    }
    return null;
  }
}