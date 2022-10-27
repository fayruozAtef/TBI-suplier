import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controler,
  required TextInputType input,
  required String?Function(String?) validate,
  required String lable,
  required IconData icon,
  bool isPassword=false,
  bool isDescription=false,
  Function(String)? onSubmitted,
  Function(String)? onChange,
  IconData? suffixIcon,
  VoidCallback? suffixWork,
})=>TextFormField(
  textDirection: (input==TextInputType.phone)? TextDirection.ltr:TextDirection.rtl,
  textAlign:(input==TextInputType.phone)?  TextAlign.end: TextAlign.start,
  controller: controler,
  keyboardType: input,
  obscureText: isPassword,
  onFieldSubmitted: onSubmitted,
  onChanged: onChange,
  validator: validate,
  maxLines: isDescription ? 5:1,
  minLines: 1,
  decoration: InputDecoration(
    labelText: lable,
    prefixIcon: Icon(
      icon,
    ),
    suffixIcon: IconButton(
      icon: Icon(
        suffixIcon,
      ),
      onPressed: suffixWork,
    ),
    border: const OutlineInputBorder(),
  ),
);

Widget myMaterialButton({
  required String label,
  required VoidCallback onPressed,
  double minWidth=double.infinity,
  double height=50.0,
})=>MaterialButton(
  minWidth: minWidth,
  height: height,
  elevation:5.0,
  shape: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
  color: Colors.teal,
  onPressed: onPressed,
  child: Text(label.toUpperCase(), style: TextStyle(color: Colors.white,fontSize: 22.0),),
);

Widget spaceBetween20()=>const SizedBox(height: 20.0,);

Future showAlertMessage({ required BuildContext context , required String title,required Widget content, required List<Widget> action}){
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("$title"),
      content: content,
      actions: action,
    ),
  );
}
