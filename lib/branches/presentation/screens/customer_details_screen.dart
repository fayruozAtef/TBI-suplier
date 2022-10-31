import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/enums.dart';
import '../controller/customer_details_bloc.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({Key? key,required this.customerId}) : super(key: key);
  final String customerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> serviceLocator<CustomerDetailsBloc>()..add(GetCustomerDetailsEvent(customerId: customerId, userId: "2")),
      child:Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,elevation: 10.0,title:  const Text('بيانات العميل',style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold),),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CustomerDetailsBloc, CustomerDetailsState>(
            buildWhen: (previous,current)=>previous.getCustomerDetailsState != current.getCustomerDetailsState,
            builder: (context, state) {
              print(state.customerData.toString());
              switch(state.getCustomerDetailsState) {
                case RequestState.loading:
                // TODO: Handle this case.
                  return Center(
                    child: LoadingAnimationWidget.waveDots(
                      color: Colors.teal,
                      size: 55,
                    ),
                  );
                case RequestState.loaded:
                // TODO: Handle this case.
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Text("أسم العميل : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),
                          Text(state.customerData.companyName,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("البريد الإلكترونى : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),
                          Text(state.customerData.email,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("رقم الهاتف : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),
                          Text(state.customerData.telephon1,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("رقم الهاتف 2 : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),
                          Text(state.customerData.telephon2,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("الحى : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),
                          Text(state.customerData.regionName,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("العنوان : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),
                          Text(state.customerData.address,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          // const Text("العنوان : ",style: TextStyle(fontSize: 20.0,color: Colors.teal,fontWeight: FontWeight.w800),),

                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Container(

                                height: 80,
                                width: 300,
                                alignment: Alignment.center,

                                // Text(state.customerData.addressUrl,style: const TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.w500),),
                                child: TextButton(
                                    style: TextButton.styleFrom(

                                        foregroundColor: Colors.white,
                                        elevation: 2,
                                        backgroundColor: Colors.teal),
                                    onPressed: () async {
                                      //launch(state.customerData.addressUrl);
                                      if(state.customerData.addressUrl.isEmpty){
                                        Fluttertoast.showToast(
                                            msg: "لا يوجد بيانات على الخريطة",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 5,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 18.0);

                                      }else{
                                        launch(state.customerData.addressUrl);
                                      }
                                    },

                                    child: Text(' العنوان على الخريطة ',style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w800),
                                    )

                                )
                            ),
                          )],
                      ),
                    ],
                  );
                case RequestState.error:
                // TODO: Handle this case.
                  return Center(
                    child: Text(state.getCustomerDetailsMessage),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}