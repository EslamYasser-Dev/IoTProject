import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/tanksController.dart';

// ignore: must_be_immutable
class RealTimeTankStat extends StatelessWidget {
     RealTimeTankStat({
    Key? key,
    required this.i,
  }) : super(key: key);
      late int i;



  final TankController _tank = Get.put(TankController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _tank.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration:  BoxDecoration(
            gradient: gradient,
            boxShadow: defualtShadow,
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    onPressed: () => {}, //details
                  )
                ],
              ),
              Text(
                _tank.tanks[i].liter.toString(), //api
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ProgressLine(
                color:const Color.fromARGB(255, 0, 0, 0),
                percentage: double.parse(_tank.tanks[i].prcentage.toString()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_tank.tanks[i].temp.toString()} C",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color:const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    "${_tank.tanks[i].prcentage.toString()}  %",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProgressLine extends StatelessWidget {
  ProgressLine({
    Key? key,
    required this.color,
    required this.percentage,
  }) : super(key: key);

  Color? color;
  final double? percentage;
  

//this controls bar color according to tank filling percentage to keep it from 15 ~ 75
  Color? statex(double percentage) {
    if (percentage > 80) {
      color = Colors.redAccent;
      
    } else if (percentage < 20) {
      color = Colors.blueAccent;
    } else {
      color = Colors.green;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width:
                constraints.maxWidth * (percentage!.toDouble() / 100), //el Bar
            height: 8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
             color: statex(percentage!.toDouble()),
            ),
          ),
        ),
      ],
    );
  }
}