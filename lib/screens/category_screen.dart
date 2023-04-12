import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(categoryImage),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
