import 'package:flutter/material.dart';
import 'package:internship_assignment/utils/app_colors.dart';

Widget botmIcons(context, IconData icon, String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: AppColors().getColor(AppColors.black).withOpacity(0.6),
        size: 30,
      ),
      const SizedBox(width: 15),
      Text(
        label,
        style: Theme.of(context).textTheme.labelMedium,
      )
    ],
  );
}

Widget ownIcon(context, bool selected, IconData icon) {
  return selected
      ? Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors().getColor(AppColors.black),
                size: 35,
              ),
              const SizedBox(width: 40),
              // Text(
              //   label,
              //   style: Theme.of(context).textTheme.titleMedium,
              // ),
            ],
          ),
        )
      : Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors().getColor(AppColors.black).withOpacity(0.5),
                size: 35,
              ),
              const SizedBox(width: 40),
            ],
          ),
        );
}
