import 'package:flutter/material.dart';
import 'package:tanks/models/history.dart';

import '../../../constants.dart';

class HistoryArea extends StatefulWidget {
  const HistoryArea({super.key});

  @override
  State<HistoryArea> createState() => _HistoryAreaState();
}

class _HistoryAreaState extends State<HistoryArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
  
      padding: const EdgeInsets.all(defaultPadding),
      decoration:  BoxDecoration(
        
        boxShadow: defualtShadow,
        gradient: gradient,
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "History",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              //minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("Tank Label"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("percent"),
                ),
              ],
              rows: List.generate(
                historys.length,
                (index) => historyRow(historys[index]), //api
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow historyRow(History historys) {
  return DataRow(
    cells: [
      DataCell(
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(Icons.access_time_outlined),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(historys.title!), //api
              ),
            ],
          ),
        ),
      ),
      DataCell(Text(historys.date!)), //api
      DataCell(Text(historys.percentage!)), //api
      // DataCell(Text(historys.id!)),//api
    ],
  );
}
