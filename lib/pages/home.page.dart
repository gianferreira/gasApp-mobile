import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gas/widgets/logo.widget.dart';
import 'package:gas/widgets/submit-form.widget.dart';
import 'package:gas/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color;
  var _gasCrtl = new MoneyMaskedTextController();
  var _alcCrtl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = 'Compensa utilizar álcool';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        child: ListView(
          children: [
            Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    gasCtrl: _gasCrtl,
                    alcohoolCtrl: _alcCrtl,
                    busy: _busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCrtl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCrtl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _color = Theme.of(context).secondaryHeaderColor;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = 'Compensa utilizar Gasolina!';
        } else {
          _resultText = 'Compensa utilizar Álcool!';
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcCrtl = new MoneyMaskedTextController();
      _gasCrtl = new MoneyMaskedTextController();

      _color = Theme.of(context).primaryColor;
      _completed = false;
      _busy = false;
    });
  }
}
