import 'package:flutter/material.dart';
import 'package:internship_assignment/utils/app_colors.dart';

Widget sideCenterCard(context, String eventName, String totel, Widget child) {
  bool isBirth = eventName == "Birthday";
  return Container(
    height: 250,
    width: MediaQuery.of(context).size.width / 1.25,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors().getColor(AppColors.rightSideCardColor),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'assets/images/star.png',
                  height: 40,
                ),
              ),
            ),
            if (isBirth)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Today $eventName',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )
            else
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(eventName,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Image.asset(
                  'assets/images/star.png',
                  height: 40,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        child,
        const SizedBox(height: 5),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 25),
              child: Text(
                "Total",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 25,
              child: VerticalDivider(
                color: Colors.white,
                width: 25,
              ),
            ),
            Text(totel,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(
              height: 25,
              child: VerticalDivider(
                color: Colors.white,
                width: 25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors().getColor(AppColors.cardBtnColor),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.send_outlined,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                "$eventName Wishing",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ],
    ),
  );
}

sideCenterCardItem(bool isBirth) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      if (isBirth)
        Image.asset(
          'assets/images/bell.png',
          width: 15,
        ),
      CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.2),
        radius: 25,
        child: Image.asset(
          "assets/images/animProfile2.png",
          width: 25,
        ),
      ),
    ],
  );
}
