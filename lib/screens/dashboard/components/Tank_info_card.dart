import 'package:tanks/models/TotalSummaryModel.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class RealTimeTankStat extends StatelessWidget {
  const RealTimeTankStat({
    Key? key,
    required this.info,
  }) : super(key: key);

  final TotalSummary info;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
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
                  color: info.color!.withOpacity(0.2),
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
            info.tankLabel.toString(), //api
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: info.color,
            percentage: int.parse(info.percentage.toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "T C: ${info.temperature.toString()} ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: const Color.fromARGB(179, 255, 255, 255)),
              ),
              Text(
                "${info.percentage.toString()}  %",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  ProgressLine({
    Key? key,
    required this.color,
    required this.percentage,
  }) : super(key: key);

  Color? color;
  final int? percentage;
  

//this controls bar color according to tank filling percentage to keep it from 15 ~ 75
  Color? statex(double percentage) {
    if (percentage > 70) {
      color = Color.fromARGB(255, 238, 36, 160);
    } else if (percentage < 20) {
      color = const Color.fromARGB(247, 255, 255, 255);
    } else {
      color = const Color.fromARGB(247, 92, 245, 99);
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
            height: 5,
            decoration: BoxDecoration(
              color: statex(percentage!.toDouble()),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
