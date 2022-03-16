import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/own_comment_bloc/own_comment_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/bloc/product_info_bloc.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';

import './widgets/own_comment_display.dart';
import './widgets/own_comment_input.dart';


class OwnCommentSection extends StatelessWidget {
  const OwnCommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial || state is ProductLoading) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductLoaded) {
          return BlocProvider(
            create: (context) => OwnCommentBloc(
                dataRepository: context.read<DataRepository>(),
                productId: state.product.id)
              ..add(OwnCommentFetch()),
            child: const OwnCommentSectionView(),
          );
        }
        return const SizedBox(
          height: 300,
          child: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}

class OwnCommentSectionView extends StatelessWidget {
  const OwnCommentSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnCommentBloc, OwnCommentState>(
      builder: (context, state) {
        if (state is OwnCommentInitial || state is OwnCommentLoading) {
          return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is OwnCommentNotExist) {
          return const OwnCommentInput();
        }else if(state is OwnCommentLoaded){
          return OwnCommentDisplay(comment: state.comment);
        }
        return const SizedBox(
          height: 300,
          child: Center(child: Text("something went wrong")),
        );
      },
    );
  }
}
