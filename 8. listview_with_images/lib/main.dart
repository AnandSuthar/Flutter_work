import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'List view with network images',
      home: ListViewController(),

    )
  );
}


class ListViewController extends StatelessWidget {

  var imagesArray = [
      "http://iastro.shangcarts.com/pub/media/notice/File-1550484786.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1550218043.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1550217808.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1550111913.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1550108862.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1550024618.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1550022739.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1549935759.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1549935073.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1549850545.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1549849978.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1549008412.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1548985261.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1548821873.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1548731040.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1548641672.jpeg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1548410089.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547774905.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547701178.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547625318.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547624883.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547619153.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547606341.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547606200.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547603338.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547602464.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547454842.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547192524.jpg",
      "http://iastro.shangcarts.com/pub/media/notice/File-1547191374.jpg"
  ];




  Widget _imageCell(String imageUrl) {

    return ListTile(
      leading: CachedNetworkImage(imageUrl: imageUrl, placeholder: CircularProgressIndicator(), errorWidget: Icon(Icons.error),),
    );

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _imageCell(imagesArray[index]);
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemCount: imagesArray.length),
    );
  }



}