import 'package:flutter/material.dart';
import 'Photo.dart';

void main() {
  runApp(
    MaterialApp(

      title: 'Future widget',
      home: HomeScreenController(),

    )
  );
}



class HomeScreenController extends StatelessWidget {


  Widget _listWithPhoto(List<Photo> photoList) {
    return ListView.builder(
      itemCount: photoList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(photoList[index].title),
          leading: Image.network(photoList[index].thumbnailUrl, width: 35, height: 35,),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Widget'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: Photo.getPhotos(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return _listWithPhoto(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }

}

























