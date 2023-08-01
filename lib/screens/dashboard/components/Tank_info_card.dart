import 'package:tanks/models/TotalSummaryModel.dart';
import 'package:flutter/material.dart';
import 'package:tanks/web_services/mqtt_clientHandlier.dart';
import '../../../constants.dart';

class RealTimeTankStat extends StatefulWidget {
  const RealTimeTankStat({
    Key? key,
    required this.info,
  }) : super(key: key);

  final TotalSummary info;

  initState() {
    MqttGetData();
  }
  State<RealTimeTankStat> createState() => _RealTimeTankStatState();
}

class _RealTimeTankStatState extends State<RealTimeTankStat> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: widget.info.color!.withOpacity(0.2),
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
            widget.info.tankLabel.toString(), //api
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: widget.info.color,
            percentage: int.parse(widget.info.percentage.toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.info.temperature.toString()} C",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Text(
                "${widget.info.percentage.toString()}  %",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
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
