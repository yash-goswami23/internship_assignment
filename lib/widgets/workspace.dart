import 'package:flutter/material.dart';
import 'package:internship_assignment/utils/app_colors.dart';

Widget workspace(context, expanded) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "WORKSPACES",
          style: TextStyle(
              color: Colors.black,
              fontSize: expanded ? 15 : 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 40),
        Flexible(
          child: Icon(
            Icons.add,
            color: AppColors().getColor(AppColors.black),
            size: expanded ? 20 : 35,
          ),
        ),
      ],
    ),
  );
}

// class WorkspaceItem {

// }

Widget workspaceItem(context, label, icon) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Icon(
            icon,
            color: AppColors().getColor(AppColors.black),
            size: 30,
          ),
        ),
      ),
    ],
  );
}
