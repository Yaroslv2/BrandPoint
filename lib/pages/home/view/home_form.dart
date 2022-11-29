import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/design/styles.dart';
import '../../../data/product.dart';
import '../data/categories.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _productLabelStyle = GoogleFonts.openSans(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14);
  final _productPriceStyle = GoogleFonts.openSans(
      color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12);

  void changeActiveCategory(index) {
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
    Widget product(product) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 0,
        semanticContainer: true,
        child: InkResponse(
          borderRadius: BorderRadius.circular(25),
          highlightShape: BoxShape.rectangle,
          containedInkWell: true,
          onTap: () {},
          child: Column(
            children: [
              Ink.image(
                height: 130,
                width: double.infinity,
                image: product.images[0],
                fit: BoxFit.contain,
              ),
              Text(product.label, style: _productLabelStyle),
              Text("${product.price} RUB", style: _productPriceStyle)
            ],
          ),
        ),
      );
      // return ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //         backgroundColor: Color.fromARGB(255, 238, 238, 238),
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(25))),
      //     onPressed: () {},
      //     child: Column(
      //       children: [
      //         Flexible(
      //             child: Image(
      //           image: product.images[0],
      //           width: 100,
      //           height: 100,
      //         )),
      //         Text(
      //           product.label,
      //           style: mainTextStyleBlack,
      //         ),
      //         Text(
      //           product.price.toString(),
      //           style: textStyleGray,
      //         )
      //       ],
      //     ));
    }

    Widget categoryButton(category, index) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: !category.isSelected
                  ? const Color.fromARGB(255, 238, 238, 238)
                  : const Color.fromARGB(255, 26, 26, 26),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            changeActiveCategory(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                color: !category.isSelected ? Colors.black : Colors.white,
                size: 40,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 7)),
              Text(
                category.label,
                style: !category.isSelected
                    ? mainTextStyleBlack
                    : mainTextStyleWhite,
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.white10,
              elevation: 0,
              title: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.8),
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "Search",
                  hintStyle: textStyleGray,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) =>
                            categoryButton(categories[index], index)),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Flexible(
                      child: GridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(
                            catalog.length,
                            ((index) {
                              return product(catalog[index]);
                            }),
                          )))
                ],
              ),
            )));
  }
}
