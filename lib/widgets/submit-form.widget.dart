import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'input.widget.dart';
import 'loading-button.widget.dart';

// ignore: must_be_immutable
class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcohoolCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.gasCtrl,
    @required this.alcohoolCtrl,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: 'Gasolina',
            ctrl: gasCtrl,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: 'Álcool',
            ctrl: alcohoolCtrl,
          ),
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          text: 'CALCULAR',
          func: submitFunc,
        ),
      ],
    );
  }
}
