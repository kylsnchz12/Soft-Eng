import 'package:flutter/material.dart';
import 'package:soft_eng/ingredients_json.dart';
import 'package:soft_eng/main_json.dart';

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
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
                        color: Color(0xFFfdeeea), fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: 320,
            height: 176,
            decoration: BoxDecoration(
                color: const Color(0xFFfdeeea),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 17, right: 17),
              child: Column(
                children: [
                  Row(children: const [
                    Text(
                      "Your Ingredients",
                      style: TextStyle(color: Color(0xFFef4642)),
                    )
                  ]),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              style: const TextStyle(color: Color(0xFFfdeeea)),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(ingredients2.length, (index) {
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
                              ingredients2[index],
                              style: const TextStyle(color: Color(0xFFfdeeea)),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(ingredients3.length, (index) {
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
                              ingredients3[index],
                              style: const TextStyle(color: Color(0xFFfdeeea)),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
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
                  children: const [
                    Icon(
                      Icons.search_outlined,
                      color: Color(0xFFfdeeea),
                      size: 22,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Search",
                      style: TextStyle(
                          color: Color(0xFFfdeeea),
                          fontWeight: FontWeight.bold),
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
