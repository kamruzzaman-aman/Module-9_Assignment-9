import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          'https://ecstasybd.com/all-images/product/Product-Image-1685858190.jpg',
      'color': 'Gray',
      'size': 'L',
      'price': '30'
    },
    {
      'productName': 'Sport Dress',
      'photo':
          'https://ecstasybd.com/all-images/product/Product-Image-1685858190.jpg',
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Column(
          children: [
            SizerUtil.orientation == Orientation.landscape
                ? Expanded(
                    flex: 20,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'My Bag',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ))
                : Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'My Bag',
                            style: TextStyle(
                              fontSize: 23.sp,
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
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Container(
                        width: double.infinity,
                        height: 14.9.h,
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
                                  padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${cartList[index]['productName']}',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                            width: 5.h,
                                            child: PopupMenuButton(
                                                iconSize: 16.sp,
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
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${cartList[index]['color']}',
                                                  style: TextStyle(
                                                    color: Color(0xFF222222),
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Size: ',
                                                  style: TextStyle(
                                                    color: Color(0xFF9B9B9B),
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${cartList[index]['size']}',
                                                  style: TextStyle(
                                                    color: Color(0xFF222222),
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 80,
                                                child: Row(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          width: 4.5.h,
                                                          height: 4.5.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x19000000),
                                                                blurRadius: 4,
                                                                offset: Offset(
                                                                    2, 6),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned.fill(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: IconButton(
                                                              iconSize: 14.sp,
                                                              splashRadius: 1,
                                                              onPressed: () {
                                                                Sub(index);
                                                              },
                                                              icon: Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w),
                                                      child: Text(
                                                        '${counters[index]}',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF222222),
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          width: 4.5.h,
                                                          height: 4.5.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x19000000),
                                                                blurRadius: 4,
                                                                offset: Offset(
                                                                    2, 6),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned.fill(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center, //stack last er ta onojaiye alignment hoy
                                                            child: IconButton(
                                                              iconSize: 14.sp,
                                                              splashRadius: 1,
                                                              onPressed: () {
                                                                Add(index);
                                                              },
                                                              icon: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4.w),
                                              child: Text(
                                                '${cartList[index]['price']}\$',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xFF222222),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total amount:',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '$totalAmount\$',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () {
                        showSnackBar();
                      },
                      child: Text(
                        'CHECK OUT',
                        style: TextStyle(fontSize: 14.sp),
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
}
