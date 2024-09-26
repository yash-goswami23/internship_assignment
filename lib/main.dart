import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/utils/app_colors.dart';
import 'package:internship_assignment/utils/title_by_index.dart';
import 'package:internship_assignment/widgets/center_card.dart';
import 'package:internship_assignment/widgets/right_side_cards.dart';
import 'package:internship_assignment/widgets/side_bar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return MaterialApp(
      title: 'SidebarX',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors().getColor(AppColors.mainBg),
        textTheme: TextTheme(
          titleSmall: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          titleMedium: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(
            color: AppColors().getColor(AppColors.black).withOpacity(0.5),
            fontSize: 20,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTitleByIndex(_controller.selectedIndex)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor:
                                  AppColors().getColor(AppColors.searchCardBg),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white70),
                              suffixIcon: const Icon(
                                Icons.search,
                                size: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  leading: IconButton(
                    onPressed: () {
                      // if (!Platform.isAndroid && !Platform.isIOS) {
                      //   _controller.setExtended(true);
                      // }
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  actions: [
                    Row(
                      children: [
                        const Icon(
                          Icons.event_note_rounded,
                        ),
                        // const SizedBox(width: 10),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            const Icon(
                              Icons.notifications_none,
                            ),
                            Image.asset(
                              'assets/images/dot.png',
                              width: 10,
                            )
                          ],
                        ),
                        // const SizedBox(width: 50),
                        const Icon(Icons.power_settings_new),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.purple.shade900,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Image.asset('assets/images/animProfile2.png',
                                height: 30),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : null,
          drawer: MySidebar(controller: _controller),
          body: Row(
            children: [
              //side bar
              if (!isSmallScreen) MySidebar(controller: _controller),
              //center
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: isSmallScreen
                          ? const EdgeInsets.all(5)
                          : const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: 40,
                            ),
                      child: Column(
                        children: [
                          //top bar
                          if (!isSmallScreen)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 1,
                                    child: Text(
                                      getTitleByIndex(
                                          _controller.selectedIndex),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade400),
                                    )),
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: AppColors()
                                          .getColor(AppColors.searchCardBg),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      hintText: "Search",
                                      hintStyle: const TextStyle(
                                          color: Colors.white70),
                                      suffixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          // gredinte card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 35, top: 15, bottom: 15),
                            margin: const EdgeInsets.only(top: 20),
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  alignment: Alignment.centerRight,
                                  fit: BoxFit.fitHeight,
                                  image:
                                      AssetImage('assets/images/card_bg.png')),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  AppColors()
                                      .getColor(AppColors.gradientRightColor),
                                  AppColors()
                                      .getColor(AppColors.gradientMidColor),
                                  AppColors()
                                      .getColor(AppColors.gradientLeftColor)
                                ],
                                stops: const [0.2, 0.4, 0.8],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "ETHEREUM 2.0",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Top Rating \nProject",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                                const Text(
                                  "Trending project and high rating \nProject Created by team.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors().getColor(
                                        AppColors.gradientCardBtnColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 20),
                                  ),
                                  child: const Text(
                                    "Learn More.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //center card
                          showCenterCardRespos(context, isSmallScreen),
                          //chart
                          Container(
                            width: double.infinity,
                            height: 300,
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 15, left: 5, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: LineChart(
                              LineChartData(
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(2019, 20),
                                      FlSpot(2020, 10),
                                      FlSpot(2021, 40),
                                      FlSpot(2022, 25),
                                      FlSpot(2023, 40),
                                      FlSpot(2024, 20),
                                    ],
                                    color: AppColors()
                                        .getColor(AppColors.lineOneColor),
                                    barWidth: 5,
                                    isCurved: true,
                                    preventCurveOverShooting: true,
                                    isStrokeJoinRound: true,
                                    dotData: const FlDotData(
                                      show: false,
                                    ),
                                    shadow: Shadow(
                                      color: AppColors()
                                          .getColor(AppColors.lineOneColor),
                                      blurRadius: 15,
                                      offset: const Offset(8, 5),
                                    ),
                                  ),
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(2019, 30),
                                      FlSpot(2021, 10),
                                      FlSpot(2022, 40),
                                      FlSpot(2023, 30),
                                      FlSpot(2024, 20),
                                    ],
                                    color: AppColors()
                                        .getColor(AppColors.lineTwoColor),
                                    barWidth: 5,
                                    isCurved: true,
                                    preventCurveOverShooting: true,
                                    isStrokeJoinRound: true,
                                    dotData: const FlDotData(
                                      show: false,
                                    ),
                                  ),
                                ],
                                titlesData: FlTitlesData(
                                    show: true,
                                    topTitles: AxisTitles(
                                      axisNameWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Over All Preformance\nThe Years",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: isSmallScreen ? 10 : 0),
                                            child: Flex(
                                              direction: isSmallScreen
                                                  ? Axis.vertical
                                                  : Axis.horizontal,
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: AppColors().getColor(
                                                      AppColors.lineTwoColor),
                                                  size: isSmallScreen ? 16 : 20,
                                                ),
                                                Text(
                                                  "Pending Done",
                                                  style: TextStyle(
                                                      color: AppColors()
                                                          .getColor(AppColors
                                                              .lineTwoColor),
                                                      fontSize: isSmallScreen
                                                          ? 14
                                                          : 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.circle,
                                                  color: AppColors().getColor(
                                                      AppColors.lineOneColor),
                                                  size: isSmallScreen ? 16 : 20,
                                                ),
                                                Text(
                                                  "Project Done",
                                                  style: TextStyle(
                                                      color: AppColors()
                                                          .getColor(AppColors
                                                              .lineOneColor),
                                                      fontSize: isSmallScreen
                                                          ? 14
                                                          : 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      axisNameSize: 70,
                                    ),
                                    rightTitles: const AxisTitles()),
                                gridData: const FlGridData(show: false),
                                borderData: FlBorderData(
                                  show: true,
                                  border: const Border(
                                    bottom: BorderSide(),
                                    left: BorderSide(),
                                  ),
                                ),
                                minY: 0,
                                maxY: 50,
                                minX: 2019,
                                maxX: 2024,
                              ),
                            ),
                          ),

                          if (isSmallScreen)
                            //Calonder
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              margin: const EdgeInsets.only(top: 40),
                              color: AppColors()
                                  .getColor(AppColors.rightSideBarBg),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "GENRAL 10:00 AM TO 7:00 PM",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  //calendar
                                  calender(),
                                  const SizedBox(height: 20),
                                  //birthday card
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        sideCenterCard(
                                          context,
                                          "Birthday",
                                          "2",
                                          Row(
                                            children: [
                                              sideCenterCardItem(true),
                                              const SizedBox(width: 10),
                                              sideCenterCardItem(true),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        sideCenterCard(
                                          context,
                                          "Anniversary",
                                          "3",
                                          Row(
                                            children: [
                                              sideCenterCardItem(false),
                                              const SizedBox(width: 10),
                                              sideCenterCardItem(false),
                                              const SizedBox(width: 10),
                                              sideCenterCardItem(false),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //rightSide
              if (!isSmallScreen)
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 40),
                      child: Column(
                        children: [
                          //topbar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.event_note_rounded,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      const Icon(
                                        Icons.notifications_none,
                                        size: 30,
                                      ),
                                      Image.asset(
                                        'assets/images/dot.png',
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  const Icon(Icons.power_settings_new,
                                      size: 30),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.purple.shade900,
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                          'assets/images/animProfile2.png',
                                          height: 38),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          //Calonder
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            margin: const EdgeInsets.only(top: 40),
                            color:
                                AppColors().getColor(AppColors.rightSideBarBg),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "GENRAL 10:00 AM TO 7:00 PM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                //calendar
                                calender(),
                                const SizedBox(height: 20),
                                //birthday card
                                sideCenterCard(
                                  context,
                                  "Birthday",
                                  "2",
                                  Row(
                                    children: [
                                      sideCenterCardItem(true),
                                      const SizedBox(width: 10),
                                      sideCenterCardItem(true),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                sideCenterCard(
                                  context,
                                  "Anniversary",
                                  "3",
                                  Row(
                                    children: [
                                      sideCenterCardItem(false),
                                      const SizedBox(width: 10),
                                      sideCenterCardItem(false),
                                      const SizedBox(width: 10),
                                      sideCenterCardItem(false),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        );
      }),
    );
  }

  Widget calender() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 15,
        left: 25,
        right: 25,
      ),
      child: SizedBox(
        child: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2005, 1, 1),
          lastDay: DateTime.utc(2025, 12, 31),
          rangeStartDay: DateTime.now(),
          rangeEndDay: DateTime.utc(2024, 9, 28),
          headerStyle: const HeaderStyle(
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
            titleTextStyle: TextStyle(
              fontSize: 16,
            ),
            titleCentered: true,
          ),
          calendarStyle: CalendarStyle(
            rangeStartDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              color: AppColors().getColor(AppColors.calEleColor),
            ),
            rangeEndDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(15),
              ),
              color: AppColors().getColor(AppColors.calEleColor),
            ),
            rangeHighlightColor:
                AppColors().getColor(AppColors.calEleColor).withOpacity(0.1),
            todayDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              color: AppColors().getColor(AppColors.lineOneColor),
            ),
            cellMargin: const EdgeInsets.all(2),
          ),
          rowHeight: 35,
        ),
      ),
    );
  }
}
