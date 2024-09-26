import 'package:flutter/material.dart';
import 'package:internship_assignment/utils/app_colors.dart';

// responcive
Widget showCenterCardRespos(context, bool isSmallScreen) {
  return Flex(
    direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
    children: [
      if (!isSmallScreen)
        Flexible(child: centerCard(context, lCCItem()))
      else
        centerCard(context, lCCItem()),
      const SizedBox(width: 12),
      if (!isSmallScreen)
        Flexible(
          child: centerCard(
            context,
            rCCard(
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // give rating 50  or less then 50
                      rCCItem(
                          imgUrl:
                              "https://th.bing.com/th/id/OIP.ZlVRslyRN8GrxPipdmP7EwHaEc?rs=1&pid=ImgDetMain",
                          name: "@username_243",
                          rank: "2051",
                          ratingInWight: 35),
                      rCCItem(
                          imgUrl:
                              "https://images.news18.com/ibnlive/uploads/2021/09/ap21238684408233-16313368473x2.jpg?impolicy=website&width=510&height=356",
                          name: "@username_911",
                          rank: "2001",
                          ratingInWight: 48),
                      rCCItem(
                          imgUrl:
                              "https://th.bing.com/th/id/OIP.MFYw_69l3Bg3nK8dm-B9qQHaE7?w=1280&h=852&rs=1&pid=ImgDetMain",
                          name: "@username_69",
                          rank: "2030",
                          ratingInWight: 20),
                      rCCItem(
                          imgUrl:
                              "https://th.bing.com/th/id/OIP.HYcPaid4mZYtCupAyIGVsQHaE8?w=1200&h=800&rs=1&pid=ImgDetMain",
                          name: "@username_786",
                          rank: "1061",
                          ratingInWight: 40),
                      rCCItem(
                          imgUrl:
                              "https://superstarsbio.com/wp-content/uploads/2019/10/Sharlto-Copley-age-330x186.jpg",
                          name: "@NowMoon0_135",
                          rank: "1005",
                          ratingInWight: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      else
        centerCard(
            context,
            rCCard(
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // give rating 50  or less then 50
                      rCCItem(
                          imgUrl:
                              "https://th.bing.com/th/id/OIP.ZlVRslyRN8GrxPipdmP7EwHaEc?rs=1&pid=ImgDetMain",
                          name: "@username_786",
                          rank: "2051",
                          ratingInWight: 35),
                      rCCItem(
                          imgUrl:
                              "https://images.news18.com/ibnlive/uploads/2021/09/ap21238684408233-16313368473x2.jpg?impolicy=website&width=510&height=356",
                          name: "@username_911",
                          rank: "2001",
                          ratingInWight: 48),
                      rCCItem(
                          imgUrl:
                              "https://th.bing.com/th/id/OIP.MFYw_69l3Bg3nK8dm-B9qQHaE7?w=1280&h=852&rs=1&pid=ImgDetMain",
                          name: "@username_786",
                          rank: "2030",
                          ratingInWight: 20),
                      rCCItem(
                          imgUrl:
                              "https://th.bing.com/th/id/OIP.HYcPaid4mZYtCupAyIGVsQHaE8?w=1200&h=800&rs=1&pid=ImgDetMain",
                          name: "@usernasdfme_23",
                          rank: "1061",
                          ratingInWight: 40),
                      rCCItem(
                          imgUrl:
                              "https://superstarsbio.com/wp-content/uploads/2019/10/Sharlto-Copley-age-330x186.jpg",
                          name: "@NowMoon0_135",
                          rank: "1005",
                          ratingInWight: 25),
                    ],
                  ),
                ),
              ),
            )),
    ],
  );
}

Widget centerCard(context, Widget child) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(vertical: 15),
    height: MediaQuery.of(context).size.height / 3,
    decoration: BoxDecoration(
      color: AppColors().getColor(AppColors.centerCardColor),
      borderRadius: BorderRadius.circular(15),
    ),
    child: child,
  );
}

rCCard(Widget item) {
  return Column(
    children: [
      Container(
        color: Colors.white.withOpacity(0.2),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              child: Text(
                "Top Creators",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Artworks",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      item
    ],
  );
}

rCCItem(
    {required String imgUrl,
    required String name,
    required String rank,
    required double ratingInWight}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
              radius: 15,
            ),
            const SizedBox(width: 8),
            Text(name, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 15),
            Text(rank, style: const TextStyle(color: Colors.white)),
          ],
        ),
        Flexible(
          child: Stack(
            children: [
              Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors()
                      .getColor(AppColors.ratingColor)
                      .withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 10,
                width: ratingInWight,
                decoration: BoxDecoration(
                  color: AppColors().getColor(AppColors.ratingColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

lCCItem() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 15, top: 20),
        child: Text(
          "All Prejests",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
      Flexible(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                child: rCenterCardItem(
                    isSelected: true,
                    imgUrl:
                        "https://www.islabit.com/wp-content/uploads/2018/09/Blockchain-3.jpg",
                    title: "Technology behind the Blockchain"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: rCenterCardItem(
                    isSelected: false,
                    imgUrl:
                        "https://th.bing.com/th/id/OIP.q6Ht55jI7NOM7K3wVU6JbAHaPM?rs=1&pid=ImgDetMain",
                    title: "Technology behind the Blockchain"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: rCenterCardItem(
                    isSelected: false,
                    imgUrl:
                        "https://th.bing.com/th/id/OIP.8HRDGRocNbCAa2GOYDVYKAHaFj?rs=1&pid=ImgDetMain",
                    title: "Technology behind the Blockchain"),
              )
            ],
          ),
        ),
      )
    ],
  );
}

rCenterCardItem(
    {required bool isSelected, required String imgUrl, required String title}) {
  return Container(
    decoration: BoxDecoration(
        color: isSelected
            ? AppColors().getColor(AppColors.cCSelectedItemColor)
            : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text.rich(TextSpan(
          text: "Project #1 • ",
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.white60,
              fontSize: 13,
              fontWeight: FontWeight.w800),
          children: const [
            TextSpan(
              text: "See project Details ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ])),
      trailing: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    ),
  );
}
