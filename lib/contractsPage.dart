import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contract.dart';
import 'ListModel.dart';

class ContractsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ContractList(),
      ),
    );
  }
}
