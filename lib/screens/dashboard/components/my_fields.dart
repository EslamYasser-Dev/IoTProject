import 'package:get/get.dart';
import 'package:tanks/responsive.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'Tank_info_card.dart';
import 'package:tanks/controllers/tanksController.dart';

// ignore: camel_case_types, must_be_immutable
class My_Fields extends StatelessWidget {

    final TankController _controller = Get.put(TankController());


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Obx(
      () => _controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tanks Real time Stats",
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
                onPressed: () => {_controller.fetchTanks()},
                icon: const Icon(Icons.refresh),
                label: const Text("Refresh"),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Responsive(
            mobile: TankInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio:
                  _size.width < 650 && _size.width > 350 ? 1.3 : 1,
            ),
            tablet:  TankInfoCardGridView(),
            desktop: TankInfoCardGridView(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    );
  }
}


class TankInfoCardGridView extends StatelessWidget {
   final TankController _controller = Get.put(TankController());
   TankInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: _controller.tanks.length,  
        itemBuilder: (context, index) =>
          RealTimeTankStat(i: index)
                
      ),
    );
  }
}
