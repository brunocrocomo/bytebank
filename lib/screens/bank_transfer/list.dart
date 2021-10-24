import 'package:bytebank/models/bank_transfer.dart';
import 'package:flutter/material.dart';

import 'form.dart';

const _appBarTitle = 'Transferências';

class BankTransferList extends StatefulWidget {
  final List<BankTransfer> _bankTransfers = [];

  BankTransferList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BankTransferListState();
  }
}

class BankTransferListState extends State<BankTransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_appBarTitle)),
      body: ListView.builder(
        itemCount: widget._bankTransfers.length,
        itemBuilder: (context, indice) {
          final bankTransfer = widget._bankTransfers[indice];
          return BankTransferListItem(transfer: bankTransfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const BankTransferForm();
          })).then((bankTransfer) => _update(bankTransfer));
        },
      ),
    );
  }

  void _update(BankTransfer? bankTransfer) {
    if (bankTransfer != null) {
      setState(() {
        widget._bankTransfers.add(bankTransfer);
      });
    }
  }
}

class BankTransferListItem extends StatelessWidget {
  final BankTransfer transfer;

  const BankTransferListItem({Key? key, required this.transfer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(transfer.value.toString()),
      subtitle: Text(transfer.accountNumber.toString()),
    ));
  }
}
