import 'package:branches/branches/presentation/component/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../core/utils/enums.dart';
import '../../data/models/range_model.dart';
import '../../data/models/region_model.dart';
import '../../data/models/set_new_branch_model.dart';
import '../../domain/usecase/add_region_usecase.dart';
import '../controller/branches_bloc.dart';

class AddMainBranchScreen extends StatefulWidget {
  const AddMainBranchScreen({Key? key}) : super(key: key);
  @override
  State<AddMainBranchScreen> createState() => _AddMainBranchScreenState();
}

class _AddMainBranchScreenState extends State<AddMainBranchScreen> {
  var companyNameController = TextEditingController();

  var contactNameController = TextEditingController();

  var telephone1Controller = TextEditingController();

  var telephone2Controller = TextEditingController();

  var emailController = TextEditingController();

  var addressController = TextEditingController();

  var mapLinkController = TextEditingController();

  var formKey=GlobalKey<FormState>();

  var formKey2=GlobalKey<FormState>();

  var formKey3=GlobalKey<FormState>();

  var newRegionName=TextEditingController();
  var newRangeName=TextEditingController();

  RangeModel? _selectedRangeModel;
  RegionModel? _selectedRegionModel;
  bool regionFlag=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultTextFormField(
                      controler: companyNameController,
                      input: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'أدخل أسم الشركة';
                        }
                        return null;
                      },
                      lable: 'أسم الشركة',
                      icon: Icons.home_work,
                    ),
                    spaceBetween20(),
                    defaultTextFormField(
                      controler: contactNameController,
                      input: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'أدخل الأسم المستخدم';
                        }
                        return null;
                      },
                      lable: 'الأسم المستخدم',
                      icon: Icons.add_home_outlined,
                    ),
                    spaceBetween20(),
                    defaultTextFormField(
                      controler: telephone1Controller,
                      input: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'أدخل رقم الهاتف';
                        }
                        return null;
                      },
                      lable: 'رقم الهاتف',
                      icon: Icons.phone_android_outlined,
                    ),
                    spaceBetween20(),
                    defaultTextFormField(
                      controler: telephone2Controller,
                      input: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'أدخل رقم الهاتف';
                        }
                        return null;
                      },
                      lable: 'رقم هاتف أخر',
                      icon: Icons.phone,
                    ),
                    spaceBetween20(),
                    defaultTextFormField(
                      controler: emailController,
                      input: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'أدخل البريد الإكترونى';
                        }
                        return null;
                      },
                      lable: 'البريد الإلكترونى',
                      icon: Icons.email_outlined,
                    ),
                    spaceBetween20(),
                    defaultTextFormField(
                      controler: addressController,
                      input: TextInputType.streetAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'أدخل العنوان';
                        }
                        return null;
                      },
                      lable: 'العنوان',
                      icon: Icons.location_pin,
                    ),
                    spaceBetween20(),
                    BlocBuilder<BranchesBloc, BranchesState>(
                      buildWhen: (previous,current)=>previous.getRangeState!=current.getRangeState,
                      builder: (context, state) {
                        switch(state.getRangeState){
                          case RequestState.loading:
                            return Container(
                              height: 60.0,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: LoadingAnimationWidget.waveDots(
                                color: Colors.teal,
                                size: 55,
                              ),
                            );
                          case RequestState.loaded:
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60.0,
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: DropdownButton<RangeModel>(
                                      dropdownColor: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(25.0),
                                      underline: const SizedBox(),
                                      onChanged: (value) {
                                        _selectedRangeModel = value;
                                        regionFlag=true;
                                        setState(() {
                                          //Get Region data according to the range id
                                          _selectedRegionModel=null;
                                          context.read<BranchesBloc>().add(GetRegionEvent(value!.rangeId));
                                        });
                                      },
                                      value: _selectedRangeModel,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      elevation: 10,
                                      isExpanded: true,
                                      hint: Row(
                                        children: const [
                                          Icon(Icons.location_pin, color: Colors.grey,),
                                          SizedBox(width: 10.0,),
                                          Text("أختر المنطقة", style: TextStyle(
                                              fontSize: 18.0, color: Colors.black54),),
                                        ],
                                      ),
                                      items: state.rangesData.map((RangeModel model) {
                                        return DropdownMenuItem<RangeModel>(
                                          value: model,
                                          child: Text(model.rangeName),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0,),
                                MaterialButton(
                                  onPressed: (){
                                    showAlertMessage(
                                      context: context,
                                      title: 'أدخل أسم المنظقة',
                                      content: Form(
                                        key: formKey3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              defaultTextFormField(
                                                controler: newRangeName,
                                                input: TextInputType.text,
                                                validate: (value){
                                                  if(value!.isEmpty){
                                                    return 'برجاء إدخال أسم المنطقة';
                                                  }
                                                  return null;
                                                },
                                                lable: "أسم المنطقة",
                                                icon: Icons.add,
                                              ),
                                              const SizedBox(height: 15.0,),
                                              myMaterialButton(
                                                label: 'حفظ',
                                                onPressed: () {
                                                  if(formKey3.currentState!.validate()){
                                                    Navigator.pop(context);
                                                    /*context.read<BranchesBloc>().add(AddNewRegionEvent(AddRegionParameters(
                                                      userId: "2",
                                                      rangeId: _selectedRangeModel!.rangeId.toString(),
                                                      regionName: newRegionName.text,
                                                    )));*/
                                                    newRangeName.clear();
                                                    setState(() {});
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      action: [],
                                    );
                                  },
                                  color: Colors.teal,
                                  height:58.0,
                                  shape:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  child: const Icon(Icons.add,size: 25.0,color: Colors.white,),),
                              ],
                            );
                          case RequestState.error:
                            return Container(
                              height: 60.0,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text("حدث خطأ ما ${state.getRangeMessage}"),
                            );
                        }
                      },
                    ),
                    if(regionFlag)
                      spaceBetween20(),
                    if(regionFlag)
                      BlocBuilder<BranchesBloc, BranchesState>(
                        buildWhen: (previous,current)=>previous.getRegionState!=current.getRegionState,
                        builder: (context, state) {
                          switch(state.getRegionState){
                            case RequestState.loading:
                              return Container(
                                height: 60.0,
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: LoadingAnimationWidget.waveDots(
                                  color: Colors.teal,
                                  size: 55,
                                ),
                              );
                            case RequestState.loaded:
                              return Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60.0,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: DropdownButton<RegionModel>(
                                        dropdownColor: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(25.0),
                                        underline: const SizedBox(),
                                        onChanged: (value) {
                                          _selectedRegionModel = value;
                                          setState(() {
                                          });
                                        },
                                        value: _selectedRegionModel,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        elevation: 10,
                                        isExpanded: true,
                                        hint: Row(
                                          children: const [
                                            Icon(Icons.location_pin, color: Colors.grey,),
                                            SizedBox(width: 10.0,),
                                            Text("أختر الحى", style: TextStyle(
                                                fontSize: 18.0, color: Colors.black54),),
                                          ],
                                        ),
                                        items: state.regionData.map((RegionModel model) {
                                          return DropdownMenuItem<RegionModel>(
                                            value: model,
                                            child: Text(model.regionName),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  MaterialButton(
                                    onPressed: (){
                                      showAlertMessage(
                                        context: context,
                                        title: 'أدخل أسم الحى',
                                        content: Form(
                                          key: formKey2,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                defaultTextFormField(
                                                  controler: newRegionName,
                                                  input: TextInputType.text,
                                                  validate: (value){
                                                    if(value!.isEmpty){
                                                      return 'برجاء إدخال أسم الحى';
                                                    }
                                                    return null;
                                                  },
                                                  lable: "أسم الحى",
                                                  icon: Icons.add,
                                                ),
                                                const SizedBox(height: 15.0,),
                                                myMaterialButton(
                                                  label: 'حفظ',
                                                  onPressed: () {
                                                    if(formKey2.currentState!.validate()){
                                                      Navigator.pop(context);
                                                      context.read<BranchesBloc>().add(AddNewRegionEvent(AddRegionParameters(
                                                        userId: "2",
                                                        rangeId: _selectedRangeModel!.rangeId.toString(),
                                                        regionName: newRegionName.text,
                                                      )));
                                                      newRegionName.clear();
                                                      setState(() {});
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        action: [],
                                      );
                                    },
                                    color: Colors.teal,
                                    height:58.0,
                                    shape:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    child: const Icon(Icons.add,size: 25.0,color: Colors.white,),),
                                ],
                              );
                            case RequestState.error:
                              return Container(
                                height: 60.0,
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Text("حدث خطأ ما ${state.getRangeMessage}"),
                              );
                          }
                        },
                      ),
                    spaceBetween20(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:MediaQuery.of(context).size.width-120.0,
                          child: defaultTextFormField(
                            isDescription: true,
                            controler: mapLinkController,
                            input: TextInputType.url,
                            validate: (value){
                              if(value!.isEmpty){
                                return "برجاء إدخال رابط الموقع";
                              }
                              return null;
                            },
                            lable: 'رابط الموقع',
                            icon: Icons.map,
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        MaterialButton(
                          minWidth: 50.0,
                          height: 60.0,
                          elevation:0.0,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          color: Colors.teal,
                          onPressed: ()async {
                            LocationPermission request=await Geolocator.checkPermission();
                            if(request ==LocationPermission.denied){
                              request =await Geolocator.requestPermission();
                              if(request==LocationPermission.always || request ==LocationPermission.whileInUse){
                                Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                                final cords = Coords(position.latitude, position.longitude);
                                const title = "Current location";
                                await MapLauncher.showMarker(
                                    mapType: MapType.google,
                                    coords: cords,
                                    title: title
                                );
                              }
                            }
                            else if(request==LocationPermission.always || request==LocationPermission.whileInUse){
                              Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                              final cords = Coords(position.latitude, position.longitude);
                              const String title = "Current location";
                              await MapLauncher.showMarker(
                                  mapType: MapType.google,
                                  coords: cords,
                                  title: title
                              );
                            }
                          },
                          child: const Icon(Icons.pin_drop_outlined,color: Colors.white,size: 30.0,),
                        ),
                      ],
                    ),
                    spaceBetween20(),
                    BlocBuilder<BranchesBloc, BranchesState>(
                      builder: (context, state) {
                      if(state.addMainBranchState != RequestState.loading) {
                        return myMaterialButton(
                          label: "حفظ",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (_selectedRegionModel != null) {
                                //Save the main Branch data
                                final SetNewBranchModel model = SetNewBranchModel(
                                  companyName: companyNameController.text,
                                  contactName: contactNameController.text,
                                  telephone1: telephone1Controller.text,
                                  telephone2: telephone2Controller.text,
                                  email: emailController.text,
                                  address: addressController.text,
                                  userId: '2',
                                  distributorId: '2',
                                  regionId: _selectedRegionModel!.regionId,
                                  addressUrl: mapLinkController.text,
                                  mainCustomerId:'',
                                );
                                context.read<BranchesBloc>().add(SetNewMainBranchEvent(model));
                                if(state.addMainBranchSuccessResult==1){
                                  _selectedRegionModel=null;
                                  _selectedRangeModel=null;
                                  companyNameController.clear();
                                  contactNameController.clear();
                                  telephone1Controller.clear();
                                  telephone2Controller.clear();
                                  emailController.clear();
                                  addressController.clear();
                                  mapLinkController.clear();
                                  regionFlag=false;
                                  setState(() {});
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "برجاء إكمال البيانات أولا",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 18.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "برجاء إكمال البيانات أولا",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 18.0);
                            }
                          },
                        );
                      }
                      else{
                        return Container(
                          height: 60.0,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: LoadingAnimationWidget.waveDots(
                            color: Colors.teal,
                            size: 55,
                          ),
                        );
                      }
                    },
                    ),
                    spaceBetween20(),
                  ],
                ),
              ))),
    );
  }
}
