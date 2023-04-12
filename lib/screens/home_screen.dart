import 'package:everything_shivpuri_web/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_square.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Everything Shivpuri',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 300,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/home_page.jpeg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            WeatherCard(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [
              //       Color(0xFFFACCCC),
              //       Color(0xFFF6EFE9),
              //     ],
              //   ),
              // ),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: [
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Hotels',
                          categoryImage: 'assets/images/hotel.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.holiday_village_outlined,
                    title: 'Hotels',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Food',
                          categoryImage: 'assets/images/food.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.dining_outlined,
                    title: 'Food',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Markets',
                          categoryImage: 'assets/images/markets.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.shopping_bag_outlined,
                    title: 'Markets',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Tourism',
                          categoryImage: 'assets/images/tourism.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.tour_outlined,
                    title: 'Tourism',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Saloons',
                          categoryImage: 'assets/images/saloons.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.cut_outlined,
                    title: 'Saloons',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Healthcare',
                          categoryImage: 'assets/images/healthcare.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.medical_information_outlined,
                    title: 'Healthcare',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Temples',
                          categoryImage: 'assets/images/temples.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.temple_hindu_outlined,
                    title: 'Temples',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Banks',
                          categoryImage: 'assets/images/banks.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.attach_money_outlined,
                    title: 'Banks',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Electronics',
                          categoryImage: 'assets/images/electeronics.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.electric_meter_outlined,
                    title: 'Electronics',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Schools',
                          categoryImage: 'assets/images/schools.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.book_outlined,
                    title: 'Schools',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Colleges',
                          categoryImage: 'assets/images/colleges.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.school_outlined,
                    title: 'Colleges',
                  ),
                  CustomSquare(
                    ontap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategoryScreen(
                          categoryName: 'Government',
                          categoryImage: 'assets/images/government.jpeg',
                        ),
                      ),
                    ),
                    icon: Icons.domain,
                    title: 'Government',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
