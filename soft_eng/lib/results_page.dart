import 'package:flutter/material.dart';
import 'package:soft_eng/dish_info.dart';
import 'package:soft_eng/finder_page.dart';
import 'package:soft_eng/ingredients_json.dart';
import 'package:soft_eng/main_json.dart';
import 'package:soft_eng/result_json.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final myController = TextEditingController();
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;

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
                const Text("Results",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 15),
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
        bottomNavigationBar: getFooter());
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
          padding:
              const EdgeInsets.only(left: 30, top: 17, right: 30, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            hintText: "Input Ingredients again",
                            hintStyle: TextStyle(color: Color(0xFFef4642)),
                            prefixIcon: Icon(
                              Icons.add,
                              color: Color(0xFFef4642),
                            )))),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    if (count1 < 3) {
                      ingredients1.add(myController.text);
                      count1++;
                    }
                    if (count1 > 3 && count2 < 3) {
                      ingredients2.add(myController.text);
                      count2++;
                    }
                    if (count3 < 3 && count2 > 3) {
                      ingredients3.add(myController.text);
                      count3++;
                    }
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
                          color: Color(0xFFfdeeea),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(results1.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 2, bottom: 5, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const DishInfo()),
                      );
                    },
                    child: Container(
                      width: 320,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(results1[index]['img']),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              results1[index]['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              results1[index]['num'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.timelapse,
                                    color: Colors.white, size: 10),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  results1[index]['time'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            )
          ])),
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
