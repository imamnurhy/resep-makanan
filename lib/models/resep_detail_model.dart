class ResepDetailModel {
  ResepDetailModel({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final Results results;

  factory ResepDetailModel.fromJson(Map<String, dynamic> json) => ResepDetailModel(
        method: json["method"],
        status: json["status"],
        results: Results.fromJson(json["results"]),
      );
}

class Results {
  Results({
    required this.title,
    required this.thumb,
    required this.servings,
    required this.times,
    required this.dificulty,
    required this.author,
    required this.desc,
    required this.needItem,
    required this.ingredient,
    required this.step,
  });

  final String title;
  final String thumb;
  final String servings;
  final String times;
  final String dificulty;
  final Author author;
  final String desc;
  final List<NeedItem> needItem;
  final List<String> ingredient;
  final List<String> step;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        title: json["title"],
        thumb: json["thumb"],
        servings: json["servings"],
        times: json["times"],
        dificulty: json["dificulty"],
        author: Author.fromJson(json["author"]),
        desc: json["desc"],
        needItem: List<NeedItem>.from(json["needItem"].map((x) => NeedItem.fromJson(x))),
        ingredient: List<String>.from(json["ingredient"].map((x) => x)),
        step: List<String>.from(json["step"].map((x) => x)),
      );
}

class Author {
  Author({
    required this.user,
    required this.datePublished,
  });

  final String user;
  final String datePublished;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        user: json["user"],
        datePublished: json["datePublished"],
      );
}

class NeedItem {
  NeedItem({
    required this.itemName,
    required this.thumbItem,
  });

  final String itemName;
  final String thumbItem;

  factory NeedItem.fromJson(Map<String, dynamic> json) => NeedItem(
        itemName: json["item_name"],
        thumbItem: json["thumb_item"],
      );
}
