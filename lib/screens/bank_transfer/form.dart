import 'package:bytebank/components/input.dart';
import 'package:bytebank/models/bank_transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criando Transferências';

const _accountNumberInputLabel = 'Número da Conta';
const _accountNumberHint = '0000';

const _valueInputLabel = 'Valor';
const _valueInputHint = '0.00';

const _confirmButtonLabel = 'Confirmar';

class BankTransferForm extends StatefulWidget {
  const BankTransferForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BankTransferFormState();
  }
}

class BankTransferFormState extends State<BankTransferForm> {
  final TextEditingController _accountNumberInputController =
      TextEditingController();
  final TextEditingController _valueInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_appBarTitle)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    children: <Widget>[
                      Input(
                          controller: _accountNumberInputController,
                          label: _accountNumberInputLabel,
                          hint: _accountNumberHint),
                      Input(
                          controller: _valueInputController,
                          label: _valueInputLabel,
                          hint: _valueInputHint,
                          icon: Icons.monetization_on),
                      ElevatedButton(
                        child: const Text(_confirmButtonLabel),
                        onPressed: () => _generateTransfer(context),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void _generateTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberInputController.text);
    final double? value = double.tryParse(_valueInputController.text);

    if (accountNumber != null && value != null) {
      final bankTransfer = BankTransfer(accountNumber, value);
      Navigator.pop(context, bankTransfer);
    }
  }
}
