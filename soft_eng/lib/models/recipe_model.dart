class RecipeModel {
  String label;
  String image;
  String source;
  String url;

  RecipeModel(
      {required this.image,
      required this.label,
      required this.source,
      required this.url});

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
        url: parsedJson["url"],
        image: parsedJson["image"],
        label: parsedJson["label"],
        source: parsedJson["source"]);
  }
}
