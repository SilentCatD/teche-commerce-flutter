import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_comment_bloc/bloc/product_comment_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/product_comment_section/widgets/comment_item.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCommentBloc, ProductCommentState>(
      builder: (context, state) {
        if (state is ProductCommentInitial || state is ProductCommentLoading) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is ProductCommentLoaded) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "View what others have said about this product:",
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(onPressed: () {
                  context.read<ProductCommentBloc>().add(ProductCommentFetch());
                }, icon: const Icon(Icons.refresh)),
                SizedBox(
                  height: 150 * state.comments.length > 500
                      ? 500
                      : 150 * state.comments.length.toDouble(),
                  child: ListView.builder(
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        return CommentItem(comment: state.comments[index]);
                      }),
                ),
              ],
            ),
          );
        }
        return const SizedBox(
          height: 300,
          child: Center(child: Text("Something went wrong")),
        );
      },
    );
  }
}
