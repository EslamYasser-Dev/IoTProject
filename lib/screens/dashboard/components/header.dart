import 'package:get/get.dart';
import 'package:tanks/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanks/screens/main/login.dart';
import '../../../constants.dart';
import '../../../controllers/MenuAppController.dart';

import '../../../controllers/loginController.dart';

class Header extends StatelessWidget {

  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          GetBuilder(
            init: MenuAppController(),
            builder: (controller) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: controller.controlMenu,
            ),
          ),
        if (!Responsive.isMobile(context))
          Text("Tanks Mnangment",
              style: TextStyle(
                  shadows: defualtShadow,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  // const ProfileCard({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        boxShadow: defualtShadow,
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context)) Icon(Icons.security_sharp),
          GetBuilder<loginController>(
            init: loginController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                
                child:const Text("LogOut"), //API name
              );
            },
          ),
          IconButton(
              icon: Icon(
                Icons.login_outlined,
                size: 25,
              ),
              color: Colors.blueAccent,
              onPressed: () {
                loginController().isLoggedIN = false;
                Get.offAll(LoginScreen());
              }), //user
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: defualtShadow),
      child: TextField(
        //API search
        decoration: InputDecoration(
          hintText: "Search",
          fillColor: secondaryColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          suffixIcon: InkWell(
            onHover: (val) {},
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(defaultPadding * 0.75),
              margin:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                color: primaryColor,
                gradient: bottonGradient,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: defualtShadow,
              ),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
          ),
        ),
      ),
    );
  }
}
