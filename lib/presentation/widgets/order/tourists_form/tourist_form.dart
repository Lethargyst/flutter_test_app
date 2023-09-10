import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/general/reduced_expansion_tile.dart';
import 'package:test_app/presentation/widgets/order/form_field/form_field.dart';
import 'package:test_app/utils/constants/form_field_type.dart';

class TouristForm extends StatefulWidget {
  const TouristForm({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<TouristForm> createState() => _TouristFormState();
}

class _TouristFormState extends State<TouristForm> {
  final _controller = ReducedExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.status == Status.failure && !state.tourists[widget.index].isValid) 
          setState(() => _controller.expand());
      },
      child: PrimaryContainer(
        child: Column(
          children: [
            Row(
              children: [
                Text('Турист №${widget.index + 1}', style: AppFonts.title),
                
                Expanded(child: Container()),

                GestureDetector(
                  onTap: () => setState(() => _controller.toggle()),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.lightBlue
                      ),
                    child: RotatedBox(
                      quarterTurns: _controller.isExpanded ? 0 : 2,
                      child: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: AppColors.blue,
                      ),
                    )
                  ),
                )
              ],
            ),
            ReducedExpansionTile(
              controller: _controller,
              maintainState: true,
              children: [
                const SizedBox(height: 20),

                PrimaryFormField(
                  formId: widget.index, 
                  type: FormFieldType.name, 
                  title: 'Имя',
                ),

                const SizedBox(height: 8),
                
                PrimaryFormField(
                  formId: widget.index,
                  type: FormFieldType.surname,
                  title: 'Фамилия'
                ),
                
                const SizedBox(height: 8),

                PrimaryFormField(
                  formId: widget.index,
                  type: FormFieldType.birthday,
                  title: 'Дата рождения'
                ),

                const SizedBox(height: 8),
                
                PrimaryFormField(
                  formId: widget.index,
                  type: FormFieldType.sitizenship,
                  title: 'Гражданство'
                ),

                const SizedBox(height: 8),
                
                PrimaryFormField(
                  formId: widget.index,
                  type: FormFieldType.passportNumber,
                  title: 'Номер загранпаспорта'
                ),

                const SizedBox(height: 8),

                PrimaryFormField(
                  formId: widget.index,
                  type: FormFieldType.passportPeriod,
                  title: 'Срок действия загранпаспорта'
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
