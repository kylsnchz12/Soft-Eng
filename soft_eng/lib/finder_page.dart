import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:soft_eng/ingredients_json.dart';
import 'package:soft_eng/main_json.dart';
import 'package:soft_eng/models/recipe_model.dart';
import 'package:soft_eng/results_page.dart';
import 'package:http/http.dart' as http;

class FinderPage extends StatefulWidget {
  const FinderPage({super.key});

  @override
  State<FinderPage> createState() => _FinderPageState();
}

class _FinderPageState extends State<FinderPage> {
  final myController = TextEditingController();
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;

  List<RecipeModel> recipes = <RecipeModel>[];

  String appId = "a9d37c70";
  String applicationKeys = "266a0142cc19b5587bf5ea456d1344bd";

  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=a9d37c70&app_key=7cf7b8d42957f39b684420d8f20afd0b";

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element) {
      RecipeModel recipeModel = RecipeModel(
          image: '1', label: '1', url: '1', source: '1', ingredients: []);
      recipeModel = RecipeModel.fromMap(element["recipe"]);
      recipes.add(recipeModel);
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void clearText() {
    myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 45,
                width: 50,
              ),
              const SizedBox(width: 7),
              const Text("Finder",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black,
                  size: 25,
                )),
          ),
        ],
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  storeData() {}

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 17, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find best recipe for",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          const Text(
            "Cooking",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                  height: 45,
                  width: 270,
                  decoration: BoxDecoration(
                      color: const Color(0xFFfdeeea),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                      controller: myController,
                      style: const TextStyle(
                          color: Color(0xFFef4642), fontSize: 15),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Input Ingredients",
                          hintStyle: TextStyle(color: Color(0xFFef4642)),
                          prefixIcon: Icon(
                            Icons.add,
                            color: Color(0xFFef4642),
                          )))),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    ingredients1.add(myController.text);
                  });
                  getRecipes(myController.text);
                  clearText();
                },
                child: Container(
                  height: 45,
                  width: 55,
                  decoration: BoxDecoration(
                      color: const Color(0xFFef4642),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                    "ADD",
                    style: TextStyle(
                        color: Color(0xFFfdeeea), fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: 320,
            height: 400,
            decoration: BoxDecoration(
                color: const Color(0xFFfdeeea),
                borderRadius: BorderRadius.circular(5)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 11, right: 11),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: const [
                      Text(
                        "Your Ingredients",
                        style: TextStyle(color: Color(0xFFef4642)),
                      )
                    ]),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: List.generate(ingredients1.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                color: const Color(0xFFef4642),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                ingredients1[index],
                                style:
                                    const TextStyle(color: Color(0xFFfdeeea)),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 125,
                decoration: BoxDecoration(
                    color: const Color(0xFFef4642),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search_outlined,
                      color: Color(0xFFfdeeea),
                      size: 22,
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: (() {
                        print("${recipes.toString()}");
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  ResultPage(myRecipes: recipes)),
                        );
                      }),
                      child: const Text(
                        "Search",
                        style: TextStyle(
                            color: Color(0xFFfdeeea),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Icon(
                      items[index]['icon'],
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
