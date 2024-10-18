import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharyApp/helper/card_item.dart';
import 'package:sharyApp/screens/bottom_navigation_bar.dart';
import 'package:sharyApp/screens/success_view.dart';
import 'package:sharyApp/widgets/custum_button.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});
  static String id = 'PaymentView';

  @override
  State<PaymentView> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentView> {
  String? caseNum, amount;

  var cards = <CardItem>[];

  @override
  void initState() {
    loadCards();
    super.initState();
  }

  void loadCards() {
    cards.add(CardItem(
        color: const Color(0xff3862F8),
        balance: "5 300.00",
        cardNumber: "**** 2236",
        date: "02/24"));
    cards.add(CardItem(
        color: const Color(0xff060F27),
        balance: "6 322.00",
        cardNumber: "**** 3344",
        date: "03/31"));
    cards.add(CardItem(
        color: const Color(0xff05144f),
        balance: "3 245.00",
        cardNumber: "**** 2456",
        date: "11/26"));
    cards.add(CardItem(
        color: const Color(0xff4f0101),
        balance: "8 311.00",
        cardNumber: "**** 2236",
        date: "09/25"));
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 43, 26, 68),
                Color.fromARGB(255, 107, 64, 113),
                Color.fromARGB(255, 179, 152, 184)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          shadowColor: Colors.black,
          title: const Text(
            'Check out',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacementNamed(context, BottomNavigation.id);
            },
            icon: const Icon(FontAwesomeIcons.arrowLeft),
          ),
          leadingWidth: 80,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05), // Responsive padding
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 18),
                  const Text(
                    "My accounts",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 23,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/notification.png",
                    width: 23,
                    height: 23,
                  ),
                  const SizedBox(width: 20)
                ],
              ),
              const SizedBox(height: 9),
              SizedBox(
                height: size.height *
                    0.25, // Responsive height for the card container
                child: ListView.builder(
                  itemCount: cards.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Container(
                        width: size.width * 0.75, // Responsive width
                        decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[4],
                          borderRadius: BorderRadius.circular(15.0),
                          color: cards[index].color,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
                                const Image(
                                  image: AssetImage("assets/images/master.png"),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(width: 17),
                                Text(
                                  cards[index].cardNumber,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  cards[index].date,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 16)
                              ],
                            ),
                            const Spacer(),
                            const Row(
                              children: [
                                SizedBox(width: 20),
                                Text(
                                  "balance",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 15.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  "\$ ${cards[index].balance}",
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, SuccessView.id);
                      },
                      child: CustomButton(
                        color: Colors.purple,
                        text: 'Pay',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
