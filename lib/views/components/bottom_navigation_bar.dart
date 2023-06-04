import 'package:ecommerce_app/views/page/account_page.dart';
import 'package:ecommerce_app/views/page/cart_page.dart';
import 'package:ecommerce_app/views/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarr extends StatefulWidget {
  const BottomNavigationBarr({super.key});

  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}


class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int activeTab= 0 ;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cập nhật trạng thái Bottom Navigation khi quay lại trang chủ
    activeTab = 0;
  }

  AppBar? appbar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: getFooter(),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePages(),
        CartPage(),
        AccountPage(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
            // curve: Curves.decelerate,
            //duration: const Duration(milliseconds: 900),
            backgroundColor: Colors.white,
            activeColor: Colors.white,
            color: Colors.black,
            gap: 8,
            selectedIndex: activeTab,
            onTabChange: (index) {
              setState(() {
                activeTab = index;
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                iconActiveColor: Colors.purple,
                //textColor: Colors.purple,
                backgroundColor: Colors.purple.withOpacity(0.2),
                iconSize: 24,
                iconColor: Colors.black,
                //text: 'Trang chủ',
              ),
              GButton(
                icon: Icons.local_grocery_store_outlined,
                iconActiveColor: Colors.deepOrange[600],
                // textColor: Colors.deepOrange[600],
                backgroundColor: Colors.deepOrange[400]!.withOpacity(0.2),
                iconSize: 24,
                iconColor: Colors.black,
                //text: 'Giỏ hàng',
              ),
              GButton(
                icon: Icons.perm_identity_outlined,
                iconActiveColor: Colors.teal,
                // textColor: Colors.teal,
                backgroundColor: Colors.teal.withOpacity(0.2),
                iconSize: 24,
                iconColor: Colors.black,
                //text: 'Tài khoản',
              ),
            ]),
      ),
    );
  }
}
