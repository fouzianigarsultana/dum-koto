import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mullayon/screens/details_screen.dart';
import 'package:mullayon/widgets/bottom_nav_bar.dart';
import 'package:mullayon/widgets/category_card.dart';
import 'package:mullayon/widgets/search_bar.dart';
import 'package:mullayon/screens/product_display.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .65,
            decoration: BoxDecoration(
              color: Color(0xFF880E4F),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/shopping.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF57C00),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Mullayon",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Top Categories",
                          svgSrc: "assets/icons/categories.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Top Product",
                          svgSrc: "assets/icons/product.svg",
                          // ProductDisplay
                          press: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ProductDisplay();
                            }),
                          );},
                        ),
                        CategoryCard(
                          title: "Today Best Deals",
                          svgSrc: "assets/icons/deals.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Top Deals",
                          svgSrc: "assets/icons/topdeals.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
