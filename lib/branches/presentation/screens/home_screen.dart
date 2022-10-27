import 'dart:io';
import 'package:branches/branches/presentation/controller/branches_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/network/check_network_connection.dart';
import '../../../core/services/services_locator.dart';
import 'add_customer_screen.dart';
import 'add_main_branch_screen.dart';
import 'all_customer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _bottomNavIndex=1;
  List<Widget> widgets = [
    AddMainBranchScreen(),
    AllBranchesScreen(),
    AddCustomerScreen(),
  ];
  List<String> titles = [
    'إضافة فرع رئيسى',
    'الرئيسية',
    'إضافة فرع',
  ];
  bool flag=false;
  Future<void> checkConnection() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        flag=true;
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "لا يوجد اتصال بالأنترنت برجاء الاتصال و المحاولة مرة أخرى",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0
      );
    }
  }
  @override
  void initState() {
    super.initState();
    checkConnection();
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen((event) {
      if(event==true) {
        if(flag==false) {
          Fluttertoast.showToast(
              msg: "تم إعادة الإتصال بنجاح",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18.0);
        }
        flag = event;
        setState(() {});
      }
      else{
        Fluttertoast.showToast(
            msg: "لا يوجد اتصال بالأنترنت برجاء الاتصال و المحاولة مرة أخرى",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 18.0
        );
      }
      print(event);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  serviceLocator<BranchesBloc>()..add(GetRangeEvent())..add(GetMainBranchEvent())..add(GetAllCustomersEvent('2')),
      child: Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,elevation: 10.0,title:  Text(titles[_bottomNavIndex],style: const TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold),),),
      body: widgets[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(()  {
            _bottomNavIndex = index;
          });
        },
        items: const[
            BottomNavigationBarItem(icon: Icon(Icons.add_business_outlined,),label: 'فرع رئيسى'),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.add_home_outlined),label: 'فرع'),
          ],
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _bottomNavIndex,

        ),
    ),);
  }
}
/*AnimatedBottomNavigationBar(
icons: [Icons.add_business_outlined, Icons.home_outlined,Icons.add_home_outlined,],
activeIndex: _bottomNavIndex,
gapLocation: GapLocation.center,
notchSmoothness: NotchSmoothness.defaultEdge,
onTap: (index) => setState(() => _bottomNavIndex = index),
//other params
),*/
