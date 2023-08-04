import 'package:tanks/responsive.dart';
import 'package:tanks/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'components/history_Area.dart';

class DashboardScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
             const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                       My_Fields(),
                    const SizedBox(height: defaultPadding),
                      HistoryArea(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                     
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
