class RecipeModel {
  String label;
  String image;
  String source;
  String url;
  List<dynamic> ingredients;

  RecipeModel(
      {required this.image,
      required this.label,
      required this.source,
      required this.url,
      required this.ingredients});

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
        url: parsedJson["url"],
        image: parsedJson["image"],
        label: parsedJson["label"],
        source: parsedJson["source"],
        ingredients: parsedJson["ingredients"]);
  }
}
