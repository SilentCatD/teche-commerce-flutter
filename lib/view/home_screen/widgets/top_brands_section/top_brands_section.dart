import 'package:flutter/material.dart';
import 'package:teche_commerce/view/home_screen/widgets/top_brands_section/widgets/brands_list.dart';

import '../title_text.dart';

class TopBrandsSection extends StatefulWidget {
  const TopBrandsSection({Key? key}) : super(key: key);
  static const double sectionHeight = 200;

  @override
  State<TopBrandsSection> createState() => _TopBrandsSectionState();
}

class _TopBrandsSectionState extends State<TopBrandsSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TopBrandsSection.sectionHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            TitleText(text: "Top brands", onPress: (){},),
            const SizedBox(height: 20),
            const BrandsList(),
          ],
        ),
      ),
    );
  }
}
