// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

// API:- https://dummyjson.com/posts

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  List<Post>? posts;
  int? total;
  int? skip;
  int? limit;

  PostModel({
    this.posts,
    this.total,
    this.skip,
    this.limit,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Post {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  Post({
    this.id,
    this.title,
    this.body,
    this.userId,
    this.tags,
    this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        reactions: json["reactions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "reactions": reactions,
      };
}
