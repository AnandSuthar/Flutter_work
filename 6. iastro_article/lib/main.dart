import 'package:flutter/material.dart';
import 'Article.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Article API',
      home: ArticleViewController(),
    )
  );
}


class ArticleViewController extends StatefulWidget {

  @override
  createState() => ArticleViewControllerState();
}

class ArticleViewControllerState extends State<ArticleViewController> {

  ArticleExt articleExt = ArticleExt();
  ScrollController _scrollController = new ScrollController();



  Widget _rightSection(Article article) {

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image.network(article.image, width: 140, height: 80, fit: BoxFit.cover,),
//              child: Image.network(article.image, width: 140, height: 80, fit: BoxFit.cover,),
            ),

          ),
          Container(
            margin: EdgeInsets.all(7.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/chatnew.jpg', width: 20, height: 20, fit: BoxFit.cover,),
                  margin: EdgeInsets.only(right: 5),
                ),
                Text("${article.totalComments}"),
                Container(
                  child: Image.asset('images/like.png', width: 20, height: 20, fit: BoxFit.cover,),
                  margin: EdgeInsets.only(right: 5, left: 5),
                ),
                Text(article.totalLikes),
              ],
            ),
          ),
        ],
      ),
    );

  }

  Widget _leftSection(Article article) {

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
            alignment: Alignment.topLeft,
            child: Text(article.title),
          ),

          Container(

            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Image.network(article.adminLogo, width: 50, height: 50, fit: BoxFit.cover,),

//                  child: Image.network(article.adminLogo, width: 50, height: 50,fit: BoxFit.cover,),
                ),
                Container(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(article.owner),
                        Text(article.createdAt),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );

  }








  Widget _articleCell(Article article) {

    return Container(
      margin: EdgeInsets.all(10.0),
      height: 124,

        child: Row(
          children: <Widget>[
            _leftSection(article),
            _rightSection(article),
          ],
        ),


    );
  }









  Widget _buildArticleTable() {

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _articleCell(articleExt.articles[index]);
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: articleExt.articles.length,
        controller: _scrollController,
    );

  }






  @override
  void initState() {
    super.initState();


    _scrollController.addListener(() {

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print("Scroll ends");
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Article API'),
      ),
      body: Center(
        child: FutureBuilder(
          future: articleExt.getArticles(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {
              return _buildArticleTable();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          },
        ),
      ),
    );
  }

}