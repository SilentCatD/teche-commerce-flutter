import 'package:flutter/material.dart';
import 'package:teche_commerce/view/home_screen/widgets/top_brands_section/widgets/brands_list.dart';

import '../title_text.dart';

class TopBrandsSection extends StatefulWidget {
  const TopBrandsSection({Key? key}) : super(key: key);

  @override
  State<TopBrandsSection> createState() => _TopBrandsSectionState();
}

class _TopBrandsSectionState extends State<TopBrandsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TitleText(text: "Top brands"),
        SizedBox(height: 20),
        BrandsList(),
      ],
    );
  }
}
