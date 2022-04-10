import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListModel.dart';

class ContractList extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<ListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contracts"),
      ),
      body: listModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: listModel.contractCount,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(listModel.contracts[index].date),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: t1,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: t2,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: t3,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: t4,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: t5,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: t6,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          child: TextField(
                            controller: t7,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                listModel.addTask(
                                    t1.text as int,
                                    t2.text as int,
                                    t3.text as int,
                                    t4.text as int,
                                    t5.text,
                                    t6.text,
                                    t7.text);
                                t1.clear();
                              },
                              child: Text("ADD"),
                            ))
                      ],
                    )),
              ],
            ),
    );
  }
}
