import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List cartList = [
    {
      'productName': 'Pullover',
      'photo':
      'https://www.johnnorris.co.uk/cdn/shop/products/Blue_Sweater.jpg',
      'color': 'Black',
      'size': 'L',
      'price': '50'
    },
    {
      'productName': 'T-Shirt',
      'photo':
      'https://mir-s3-cdn-cf.behance.net/project_modules/1400/68993788541761.5dd95dc31b698.jpg',
      'color': 'Gray',
      'size': 'L',
      'price': '30'
    },
    {
      'productName': 'Sport Dress',
      'photo':
      'https://www.jteesports.com/cdn/shop/products/jtee-006_compressed.jpg',
      'color': 'Black',
      'size': 'M',
      'price': '43'
    }
  ];

  List<int> counters = [];
  int totalAmount = 0;
  @override
  void initState() {
    super.initState();
    counters = List.generate(cartList.length, (index) => 1);

    totalAmount = calculateTotalAmount();
  }

  int calculateTotalAmount() {
    int total = 0;
    for (var product in cartList) {
      total += int.parse(product['price']);
    }
    return total;
  }

  Sub(index) {
    if (counters[index] > 1) {
      counters[index]--;
      int unitPrice = int.parse(cartList[index]['price']);
      totalAmount = totalAmount - unitPrice;
      setState(() {});
    }
  }

  Add(index) {
    counters[index]++;
    int unitPrice = int.parse(cartList[index]['price']);
    totalAmount = totalAmount + unitPrice;
    setState(() {});
  }

  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulation (Payble Amount: $totalAmount\$)'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  iconSize: 6.sw,
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.sw),
              child: Column(
                children: [
                  Expanded(
                      flex: 20,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'My Bag',
                              style: TextStyle(
                                fontSize: 8.sw,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 80,
                      child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.sh),
                            child: Container(
                              width: double.infinity,
                              height: 18.sh,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 4,
                                    offset: Offset(1, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                '${cartList[index]['photo']}',
                                              ),
                                            )),
                                      )),
                                  Expanded(
                                      flex: 65,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 3.sw, top: 1.sh),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '${cartList[index]['productName']}',
                                                  style: TextStyle(
                                                    fontSize: 5.sw,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.sh,
                                                  child: PopupMenuButton(
                                                      iconSize: 8.sw,
                                                      color: Color(0xFF9B9B9B),
                                                      itemBuilder: (context) {
                                                        return [];
                                                      },
                                                      onSelected: (value) {}),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Color: ',
                                                        style: TextStyle(
                                                          color: Color(0xFF9B9B9B),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                        '${cartList[index]['color']}',
                                                        style: TextStyle(
                                                          color: Color(0xFF222222),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.sw,
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Size: ',
                                                        style: TextStyle(
                                                          color: Color(0xFF9B9B9B),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                        '${cartList[index]['size']}',
                                                        style: TextStyle(
                                                          color: Color(0xFF222222),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 2.sw,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox( //<-- SEE HERE
                                                  width: 5.sh,
                                                  height: 5.sh,
                                                  child: FittedBox( //<-- SEE HERE
                                                    child: FloatingActionButton( //<-- SEE HERE
                                                      backgroundColor: Colors.white,
                                                      onPressed: () {
                                                        Sub(index);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 35,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),


                                                Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 3.sw),
                                                  child: Text(
                                                    '${counters[index]}',
                                                    style: TextStyle(
                                                      color:
                                                      Color(0xFF222222),
                                                      fontSize: 5.sw,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ),

                                                SizedBox( //<-- SEE HERE
                                                  width: 5.sh,
                                                  height: 5.sh,
                                                  child: FittedBox( //<-- SEE HERE
                                                    child: FloatingActionButton( //<-- SEE HERE
                                                      backgroundColor: Colors.white,
                                                      onPressed: () {
                                                        Add(index);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 35,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20.sw,),
                                                Text(
                                                  '${cartList[index]['price']}\$',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF222222),
                                                    fontSize: 5.sw,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.sh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total amount:',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 6.sw,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '$totalAmount\$',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 6.sw,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.sh,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 6.sh,
                          child: ElevatedButton(
                            onPressed: () {
                              showSnackBar();
                            },
                            child: Text(
                              'CHECK OUT',
                              style: TextStyle(fontSize: 5.sw,),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: Color(0xFFDB3022),
                              shadowColor: Color(0x3FD32525),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  iconSize: 8.sw,
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.sw),
              child: Column(
                children: [
                  Expanded(
                      flex: 15,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'My Bag',
                              style: TextStyle(
                                fontSize: 8.sw,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 85,
                      child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.sh),
                            child: Container(
                              width: double.infinity,
                              height: 18.sh,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 4,
                                    offset: Offset(1, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                '${cartList[index]['photo']}',
                                              ),
                                            )),
                                      )),
                                  Expanded(
                                      flex: 65,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 3.sw, top: 1.sh),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '${cartList[index]['productName']}',
                                                  style: TextStyle(
                                                    fontSize: 5.sw,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.sh,
                                                  child: PopupMenuButton(
                                                      iconSize: 8.sw,
                                                      color: Color(0xFF9B9B9B),
                                                      itemBuilder: (context) {
                                                        return [];
                                                      },
                                                      onSelected: (value) {}),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Color: ',
                                                        style: TextStyle(
                                                          color: Color(0xFF9B9B9B),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                        '${cartList[index]['color']}',
                                                        style: TextStyle(
                                                          color: Color(0xFF222222),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.sw,
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Size: ',
                                                        style: TextStyle(
                                                          color: Color(0xFF9B9B9B),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                        '${cartList[index]['size']}',
                                                        style: TextStyle(
                                                          color: Color(0xFF222222),
                                                          fontSize: 3.sw,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 2.sw,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox( //<-- SEE HERE
                                                  width: 5.sh,
                                                  height: 5.sh,
                                                  child: FittedBox( //<-- SEE HERE
                                                    child: FloatingActionButton( //<-- SEE HERE
                                                      backgroundColor: Colors.white,
                                                      onPressed: () {
                                                        Sub(index);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 35,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),


                                                Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 3.sw),
                                                  child: Text(
                                                    '${counters[index]}',
                                                    style: TextStyle(
                                                      color:
                                                      Color(0xFF222222),
                                                      fontSize: 5.sw,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ),

                                                SizedBox( //<-- SEE HERE
                                                  width: 5.sh,
                                                  height: 5.sh,
                                                  child: FittedBox( //<-- SEE HERE
                                                    child: FloatingActionButton( //<-- SEE HERE
                                                      backgroundColor: Colors.white,
                                                      onPressed: () {
                                                        Add(index);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 35,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20.sw,),
                                                Text(
                                                  '${cartList[index]['price']}\$',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF222222),
                                                    fontSize: 5.sw,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.sh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total amount:',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 6.sw,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '$totalAmount\$',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 6.sw,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.sh,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 6.sh,
                          child: ElevatedButton(
                            onPressed: () {
                              showSnackBar();
                            },
                            child: Text(
                              'CHECK OUT',
                              style: TextStyle(fontSize: 5.sw,),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: Color(0xFFDB3022),
                              shadowColor: Color(0x3FD32525),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return  Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize: 25,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'My Bag',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 90,
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.sh),
                          child: Container(
                            width: double.infinity,
                            height: 16.sh,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 4,
                                  offset: Offset(1, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              '${cartList[index]['photo']}',
                                            ),
                                          )),
                                    )),
                                Expanded(
                                    flex: 65,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 3.sw, top: 1.sh),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${cartList[index]['productName']}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.sh,
                                                child: PopupMenuButton(
                                                    iconSize: 30,
                                                    color: Color(0xFF9B9B9B),
                                                    itemBuilder: (context) {
                                                      return [];
                                                    },
                                                    onSelected: (value) {}),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Color: ',
                                                      style: TextStyle(
                                                        color: Color(0xFF9B9B9B),
                                                        fontSize: 3.sw,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                      '${cartList[index]['color']}',
                                                      style: TextStyle(
                                                        color: Color(0xFF222222),
                                                        fontSize: 3.sw,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.sw,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Size: ',
                                                      style: TextStyle(
                                                        color: Color(0xFF9B9B9B),
                                                        fontSize: 3.sw,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                      '${cartList[index]['size']}',
                                                      style: TextStyle(
                                                        color: Color(0xFF222222),
                                                        fontSize: 3.sw,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.6.sw,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox( //<-- SEE HERE
                                                width: 5.sh,
                                                height: 5.sh,
                                                child: FittedBox( //<-- SEE HERE
                                                  child: FloatingActionButton( //<-- SEE HERE
                                                    backgroundColor: Colors.white,
                                                    onPressed: () {
                                                      Sub(index);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 35,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),


                                              Padding(
                                                padding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 3.sw),
                                                child: Text(
                                                  '${counters[index]}',
                                                  style: TextStyle(
                                                    color:
                                                    Color(0xFF222222),
                                                    fontSize: 5.sw,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ),

                                              SizedBox( //<-- SEE HERE
                                                width: 5.sh,
                                                height: 5.sh,
                                                child: FittedBox( //<-- SEE HERE
                                                  child: FloatingActionButton( //<-- SEE HERE
                                                    backgroundColor: Colors.white,
                                                    onPressed: () {
                                                      Add(index);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 35,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 14.sw,),
                                              Text(
                                                '${cartList[index]['price']}\$',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xFF222222),
                                                  fontSize: 5.sw,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.sh),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total amount:',
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 6.sw,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '$totalAmount\$',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 6.sw,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.sh,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 6.sh,
                        child: ElevatedButton(
                          onPressed: () {
                            showSnackBar();
                          },
                          child: Text(
                            'CHECK OUT',
                            style: TextStyle(fontSize: 5.sw,),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: Color(0xFFDB3022),
                            shadowColor: Color(0x3FD32525),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
