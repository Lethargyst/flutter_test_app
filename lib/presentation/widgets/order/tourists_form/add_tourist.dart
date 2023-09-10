import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';
import 'package:test_app/presentation/widgets/general/primary_container.dart';

class AddTourist extends StatelessWidget {
  const AddTourist({ super.key });

  @override
  Widget build(BuildContext context){
    return PrimaryContainer(
      child: Row(
        children: [
          Text('Добавить туриста', style: AppFonts.title),

          Expanded(child: Container()),

          GestureDetector(
            onTap: () => context.read<OrderBloc>().add(TouristAddedEvent()),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                color: AppColors.blue
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}