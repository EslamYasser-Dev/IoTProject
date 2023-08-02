import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanks/models/TanksData_Model.dart';
import '../../../constants.dart';
import '../../../controllers/tanksController.dart';

class HistoryArea extends StatelessWidget {
  final TankController _controller = Get.put(TankController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
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
                          label: Text("Time Stamp"),
                        ),
                        DataColumn(
                          label: Text("ID"),
                        ),
                        DataColumn(
                          label: Text("percent"),
                        ),
                      ],
                      rows: List.generate(
                         _controller.tanks.length,
                        (index) => historyRow(_controller.tanks[index]), //api
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

DataRow historyRow(Tank tank) {
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
                child: Text(tank.timeStamp.toString()), //api
              ),
            ],
          ),
        ),
      ),
      DataCell(Text(tank.id.toString())), //api
      DataCell(Text(tank.prcentage.toString())), //a pi
    ],
  );
}
