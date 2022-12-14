import 'package:flutter/material.dart';
import 'package:soft_eng/finder_page.dart';
import 'package:soft_eng/ingredients_json.dart';
import 'package:soft_eng/lasagna_json.dart';
import 'package:soft_eng/main_json.dart';
import 'package:soft_eng/models/recipe_model.dart';

class DishInfo extends StatefulWidget {
  String label;
  String image;
  String source;
  String url;
  List<dynamic> ingredients;

  DishInfo(
      {super.key,
      required this.label,
      required this.image,
      required this.url,
      required this.source,
      required this.ingredients});

  @override
  State<DishInfo> createState() => _DishInfoState();
}

class _DishInfoState extends State<DishInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: getBody(),
        bottomNavigationBar: getFooter());
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(children: <Widget>[
          SizedBox(
            width: size.height - 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.white.withOpacity(0.98),
                            Colors.white.withOpacity(0)
                          ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.source,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Visit for more details: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 13),
                      ),
                      Text(
                        widget.url,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 13),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            color: const Color(0xFFef4642),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.timelapse,
                                color: Colors.white, size: 14),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '10 mins',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(widget.ingredients.length,
                                (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFfdeeea),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    widget.ingredients[index]
                                                        ['image']))),
                                      ),
                                      const SizedBox(height: 4),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.ingredients[index]['food'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            widget.ingredients[index]['text'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 8),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        })),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 350,
                        height: 219,
                        decoration: BoxDecoration(
                            color: const Color(0xFFfdeeea),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Procedure",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(lasagnaProcedure.length,
                                    (index) {
                                  return Column(
                                    children: const [
                                      Text(
                                        " ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                      SizedBox(height: 3)
                                    ],
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.blue.withOpacity(0),
                elevation: 0.0,
              ))
        ]),
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
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const FinderPage()),
                  );
                },
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
