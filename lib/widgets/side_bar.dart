import 'package:flutter/material.dart';
import 'package:internship_assignment/utils/app_colors.dart';
import 'package:internship_assignment/widgets/custom_icon.dart';
import 'package:internship_assignment/widgets/show_toast.dart';
import 'package:internship_assignment/widgets/workspace.dart';
import 'package:sidebarx/sidebarx.dart';

class MySidebar extends StatelessWidget {
  const MySidebar({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
          hoverTextStyle: Theme.of(context).textTheme.labelMedium,
          selectedItemMargin: const EdgeInsets.only(
            right: 0,
          ),
          selectedItemPadding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width / 80,
            bottom: MediaQuery.of(context).size.width / 80,
            left: MediaQuery.of(context).size.width / 20,
          ),
          itemPadding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
          textStyle: Theme.of(context).textTheme.labelMedium,
          selectedTextStyle: Theme.of(context).textTheme.titleMedium,
          selectedItemDecoration: BoxDecoration(
            color: AppColors().getColor(AppColors.mainBg),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(26),
              bottomLeft: Radius.circular(26),
            ),
          )),
      extendedTheme: SidebarXTheme(
        width: isSmallScreen ? 250 : MediaQuery.of(context).size.width / 4.5,
      ),
      headerDivider: const Divider(
        color: Colors.black26,
        indent: 10,
        endIndent: 10,
      ),
      headerBuilder: (context, extended) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/cmpLogo.png'),
                ),
              ),
              const Divider(
                color: Colors.black26,
                indent: 10,
                endIndent: 10,
              ),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 1.5),
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://th.bing.com/th/id/OIP.yMCP1MHKBiwFGA4tPZlgZgHaHa?w=2017&h=2017&rs=1&pid=ImgDetMain",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  Text(
                    "Pooja Mishra",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  Container(
                    width: 70,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple.shade900),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      "Admin",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                ],
              )
            ],
          ),
        );
      },
      items: [
        SidebarXItem(
          iconBuilder: (selected, hovered) {
            return ownIcon(context, selected, Icons.house_rounded);
          },
          // SideMenuExpansionItem
          label: "Home",
          onTap: () {
            debugPrint('Home');
          },
        ),
        SidebarXItem(
            iconBuilder: (selected, hovered) =>
                ownIcon(context, selected, Icons.people_outline),
            label: 'Employee'),
        SidebarXItem(
            iconBuilder: (selected, hovered) =>
                ownIcon(context, selected, Icons.checklist),
            label: 'Attendance'),
        SidebarXItem(
          iconBuilder: (selected, hovered) =>
              ownIcon(context, selected, Icons.calendar_month_outlined),
          label: 'Summary',
          selectable: false,
          onTap: () => showDisabledAlert(context, "Click"),
        ),
        SidebarXItem(
          iconBuilder: (selected, hovered) =>
              ownIcon(context, selected, Icons.info_outline),
          label: 'Information',
          selectable: false,
          onTap: () => showDisabledAlert(context, "Click"),
        ),
      ],
      showToggleButton: true,
      toggleButtonBuilder: (context, extended) {
        return Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 30,
              bottom: MediaQuery.of(context).size.height / 25),
          child: Column(
            children: [
              botmIcons(context, Icons.settings_outlined, "Setting"),
              const SizedBox(height: 5),
              botmIcons(context, Icons.logout_outlined, "Logout"),
            ],
          ),
        );
      },
      footerBuilder: (context, extended) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 80),
          child: Column(
            children: [
              Container(
                color: AppColors().getColor(AppColors.skyBlue),
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 80),
                child: workspace(context, isSmallScreen),
              ),
              workspaceItem(
                  context, "Adstacks", Icons.keyboard_arrow_down_outlined),
              workspaceItem(
                  context, "Finance", Icons.keyboard_arrow_down_outlined)
            ],
          ),
        );
      },
    );
  }
}
