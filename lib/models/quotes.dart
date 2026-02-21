/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

class Quotes {
    Quotes({
        required this.total,
        required this.limit,
        required this.skip,
        required this.quotes,
    });

    int total;
    int limit;
    int skip;
    List<Quote> quotes;

    factory Quotes.fromJson(Map<dynamic, dynamic> json) => Quotes(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
    };
}

class Quote {
    Quote({
        required this.quote,
        required this.author,
        required this.id,
    });

    String quote;
    String author;
    int id;

    factory Quote.fromJson(Map<dynamic, dynamic> json) => Quote(
        quote: json["quote"],
        author: json["author"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "quote": quote,
        "author": author,
        "id": id,
    };
}
