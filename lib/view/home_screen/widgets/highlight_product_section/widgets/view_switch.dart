import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/switch_view_bloc/switch_view_bloc.dart';
import 'package:teche_commerce/enum/switch_view_type.dart';

class ViewSwitch extends StatelessWidget {
  const ViewSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: BlocBuilder<SwitchViewCubit, SwitchViewType>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.read<SwitchViewCubit>().toggle(SwitchViewType.gridView);
                },
                child: Opacity(
                  opacity: state == SwitchViewType.gridView ? 1 : 0.5,
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.grid_view_rounded),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<SwitchViewCubit>().toggle(SwitchViewType.listView);
                },
                child: Opacity(
                  opacity: state == SwitchViewType.listView ? 1 : 0.5,
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.view_agenda_rounded),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
