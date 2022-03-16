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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("View what others have said about this product:", style: TextStyle(fontSize: 18),),
              ),
              SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        return CommentItem(comment: state.comments[index]);
                      }),
                ),
              ),
            ],
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
