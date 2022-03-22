import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/product_info_bloc.dart';
import 'package:teche_commerce/controller/product_comment_bloc/product_comment_bloc.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/product_comment_section/widgets/product_comments.dart';

class ProductCommentSection extends StatelessWidget {
  const ProductCommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductComments();
  }
}
