import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';



class ArticleExt {

  List<Article> articles = [];
  ArticlePaging paging = ArticlePaging();


  Future<void> getFirstPage() async {

    paging.currentPage = 0;

    Map<String, dynamic> body = {"page": paging.currentPage, "storeId": "1", "cat": "1", "limit":0};
    Map<String, String> header = {"Content-Type": "application/json", "Authorization": "Bearer 17avan3lwjhr45bnyojkaae6g849rbt4"};


    var url = "http://18.136.9.203/index.php/rest/V1/notice/list";
    await http.post(url, body: json.encode(body),headers: header)
        .then((response) {
      print("Response status: ${response.statusCode}");

      final decoded = (json.decode(response.body) as List).first as Map;
      final jsonArticles = decoded['data'] as List;
      final pagingJSON = decoded['paging'] as Map;


      articles = [];
      for (var jsonArticle in jsonArticles) {
        Article article = Article.fromJSON(jsonArticle);
        articles.add(article);
      }

      paging = ArticlePaging.fromJSON(pagingJSON);

//      compute(_articleMappingFromJSON, response.body);

    });


  }

  Future<void> getNextPage() async {

    paging.currentPage += 1;

    Map<String, dynamic> body = {"page": paging.currentPage, "storeId": "1", "cat": "1", "limit": 0};
    Map<String, String> header = {"Content-type": "application/json", "Authorization": "Bearer 17avan3lwjhr45bnyojkaae6g849rbt4"};

    var url = "http://18.136.9.203/index.php/rest/V1/notice/list";
    await http.post(url, body: json.encode(body), headers: header).then((response) {


      final decoded = (json.decode(response.body) as List).first as Map;
      final jsonArticles = decoded['data'] as List;


      for (var jsonArticle in jsonArticles) {
        Article article = Article.fromJSON(jsonArticle);
        articles.add(article);
      }


    });

  }


  Future<void> getData() async {

    Map<String, dynamic> body = {"page": paging.currentPage, "storeId": "1", "cat": "1", "limit": 0};
    Map<String, String> header = {"Content-type": "application/json", "Authorization": "Bearer 17avan3lwjhr45bnyojkaae6g849rbt4"};

    var url = "http://18.136.9.203/index.php/rest/V1/notice/list";
    await http.post(url, body: json.encode(body), headers: header).then((response) {


      final decoded = (json.decode(response.body) as List).first as Map;
      final jsonArticles = decoded['data'] as List;


      for (var jsonArticle in jsonArticles) {
        Article article = Article.fromJSON(jsonArticle);
        articles.add(article);
      }


    });

  }



  _articleMappingFromJSON(String jsonData) {
    final jsonArticles = json.decode(jsonData);

    for (var jsonArticle in jsonArticles) {
      Article article = Article.fromJSON(jsonArticle);
      articles.add(article);
    }
  }


}












class Article {

  String title;
  String id;
  String categoryId;
  String categoryName;
  String createdAt;
  String content;
  String metaKeywords;
  String merchantName;
  String merchantId;
  String totalLikes;
  String owner;
  String adminLogo;
  int totalComments;
  int isLiked;
  String image;

  Article({this.title, this.id, this.categoryId, this.categoryName, this.createdAt, this.content, this.metaKeywords, this.merchantName, this.merchantId, this.totalLikes, this.owner, this.adminLogo, this.totalComments, this.isLiked, this.image});

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
      title:          json['title']           as String,
      id:             json['id']              as String,
      categoryId:     json['category_id']     as String,
      categoryName:   json['category_name']   as String,
      createdAt:      json['created_at']      as String,
      content:        json['content']         as String,
      metaKeywords:   json['metakeywords']    as String,
      merchantName:   json['merchant_name']   as String,
      merchantId:     json['merchant_id']     as String,
      totalLikes:     json['total_likes']     as String,
      owner:          json['owner']           as String,
      adminLogo:      json['adminlogo']       as String,
      totalComments:  json['total_comments']  as int,
      isLiked:        json['is_like']         as int,
      image:          json['image']           as String
    );
  }

}










class ArticlePaging {
  int totalRecords;
  int totalPages;
  int currentPage = 1;
  int perPage;

  ArticlePaging({this.totalRecords, this.totalPages, this.currentPage, this.perPage});

  factory ArticlePaging.fromJSON(Map<String, dynamic> json) {
    return ArticlePaging(
      totalRecords: json['total_records'] as int,
      totalPages:   json['total_page']    as int,
      currentPage:  json['current_page']  as int,
      perPage:      json['per_page']      as int
    );
  }

}