import 'package:flutter/material.dart';
import 'package:test_project/design/styles.dart';
import '../data/categories.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  void ChangeActiveCategory(index) {
    setState(() {
      if (categories[index].isSelected) {
        categories[index].isSelected = !categories[index].isSelected;
      } else {
        for (final a in categories) {
          if (a.isSelected) a.isSelected = !a.isSelected;
        }
        categories[index].isSelected = !categories[index].isSelected;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text("тут должен быть поиск"),
            ),
            body: Column(
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              height: 60,
                              width: 110,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: !categories[index]
                                            .isSelected
                                        ? const Color.fromARGB(
                                            255, 238, 238, 238)
                                        : const Color.fromARGB(255, 26, 26, 26),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  ChangeActiveCategory(index);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(categories[index].icon,
                                        color: !categories[index].isSelected
                                            ? Colors.black
                                            : Colors.white,
                                        size: 40),
                                    const Padding(
                                        padding: EdgeInsets.only(bottom: 7)),
                                    Text(
                                      categories[index].label,
                                      style: !categories[index].isSelected
                                          ? mainTextStyleBlack
                                          : mainTextStyleWhite,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            )));
  }
}
