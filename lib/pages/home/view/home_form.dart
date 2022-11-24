import 'package:flutter/material.dart';
import '../widgets/category_button.dart';
import '../data.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text("тут должен быть поиск"),
            ),
            body: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: categoryButton(categories[index]),
                          );
                        }))
              ],
            )));
  }
}
