/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
    Posts({
        required this.total,
        required this.limit,
        required this.skip,
        required this.posts,
    });

    int total;
    int limit;
    int skip;
    List<Post> posts;

    factory Posts.fromJson(Map<dynamic, dynamic> json) => Posts(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    Post({
        required this.reactions,
        required this.id,
        required this.title,
        required this.body,
        required this.userId,
        required this.views,
        required this.tags,
    });

    Reactions reactions;
    int id;
    String title;
    String body;
    int userId;
    int views;
    List<String> tags;

    factory Post.fromJson(Map<dynamic, dynamic> json) => Post(
        reactions: Reactions.fromJson(json["reactions"]),
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        views: json["views"],
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<dynamic, dynamic> toJson() => {
        "reactions": reactions.toJson(),
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
        "views": views,
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}

class Reactions {
    Reactions({
        required this.dislikes,
        required this.likes,
    });

    int dislikes;
    int likes;

    factory Reactions.fromJson(Map<dynamic, dynamic> json) => Reactions(
        dislikes: json["dislikes"],
        likes: json["likes"],
    );

    Map<dynamic, dynamic> toJson() => {
        "dislikes": dislikes,
        "likes": likes,
    };
}
