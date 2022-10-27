import 'package:branches/branches/data/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/utils/enums.dart';
import '../component/shared_component.dart';
import '../controller/branches_bloc.dart';

class AllBranchesScreen extends StatefulWidget {
  const AllBranchesScreen({Key? key}) : super(key: key);

  @override
  State<AllBranchesScreen> createState() => _AllBranchesScreenState();
}

class _AllBranchesScreenState extends State<AllBranchesScreen> {
  var searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child:SingleChildScrollView(
        child: Column(
          children: [
            defaultTextFormField(
              controler: searchController,
              input: TextInputType.text,
              validate: (value){
                return null;
              },
              onChange: (value){
                //search on the list with the entered value
                print(value);
                setState(() {
                });
              },
              lable: "بحث",
              icon: Icons.search_outlined,
            ),
            BlocBuilder<BranchesBloc, BranchesState>(
              builder: (context, state) {
                switch(state.getAllCustomersState) {
                  case RequestState.loading:
                    return Center(
                        child: LoadingAnimationWidget.waveDots(
                          color: Colors.teal,
                          size: 55,
                        ));
                  case RequestState.loaded:
                    return DataTable(
                      columns: const [
                        DataColumn(
                            numeric: false,
                            label: Center(
                              child: Text('العملاء',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  )),
                            )),
                      ],
                      rows:state.allCustomers.where((element) => element.customerName.contains(searchController.text)).map((e) => buildDataRow(e, state.allCustomers.indexOf(e), context)).toList(),
                    );
                  case RequestState.error:
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(state.getAllCustomersMessage),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  DataRow buildDataRow(CustomerModel branch, int index, BuildContext context){
    return DataRow(
        color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return (index%2==0)? Colors.teal[100]: null;
            }),
        cells: [
          DataCell(Text(branch.customerName,overflow: TextOverflow.ellipsis, maxLines: 1,),onTap: (){_navigateToDetails(context,branch);}),
        ]);
  }

  void _navigateToDetails(BuildContext context,CustomerModel branch) {
    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BranchDetailsScreen(branch: branch,), ));
  }
}
