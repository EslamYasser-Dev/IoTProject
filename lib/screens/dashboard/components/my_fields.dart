import 'package:tanks/models/TotalSummaryModel.dart';
import 'package:tanks/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../repos/tankRepo.dart';
import 'file_info_card.dart';

// ignore: camel_case_types
class My_Fields extends StatelessWidget {

  late TankRepo tankRepo;

  My_Fields({super.key});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tank Real-Time Stats",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: TankInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet:const TankInfoCardGridView(),
          desktop: TankInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class TankInfoCardGridView extends StatelessWidget {
  const TankInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: summarys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => RealTimeTankStat(info: summarys[index]),
    );
  }
}
