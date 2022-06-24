class ResepsModel {
  ResepsModel({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<Result> results;

  factory ResepsModel.fromJson(Map<String, dynamic> json) => ResepsModel(
        method: json["method"],
        status: json["status"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.title,
    required this.thumb,
    required this.key,
    required this.times,
    required this.portion,
    required this.dificulty,
  });

  final String title;
  final String thumb;
  final String key;
  final String times;
  final String portion;
  final String dificulty;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        thumb: json["thumb"],
        key: json["key"],
        times: json["times"],
        portion: json["portion"],
        dificulty: json["dificulty"],
      );
}
