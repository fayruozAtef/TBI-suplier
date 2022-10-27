import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{

  final String statusMessage;

  const ErrorMessageModel({
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusMessage: json['Message'],
      );
  @override
  // TODO: implement props
  List<Object?> get props => [statusMessage,];

}


// {
// "Message": "An error has occurred.",
// "ExceptionMessage": "An error occurred when trying to create a controller of type 'ReportsController'. Make sure that the controller has a parameterless public constructor.",
// "ExceptionType": "System.InvalidOperationException",
// "StackTrace": "   at System.Web.Http.Dispatcher.DefaultHttpControllerActivator.Create(HttpRequestMessage request, HttpControllerDescriptor controllerDescriptor, Type controllerType)\r\n   at System.Web.Http.Dispatcher.HttpControllerDispatcher.<SendAsync>d__15.MoveNext()",
// "InnerException": {
// "Message": "An error has occurred.",
// "ExceptionMessage": "'~\u000b\u0000#\u000e\u0000Barc�' is not a valid virtual path.",
// "ExceptionType": "System.Web.HttpException",
// "StackTrace": "   at System.Web.VirtualPath.Create(String virtualPath, VirtualPathOptions options)\r\n   at System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(String path)\r\n   at Connibrary.GetSettings.EncryptSettings()\r\n   at Connibrary.GetSettings.GetConnectionString()\r\n   at Connibrary.MyFunctions.fireConnection()\r\n   at Connibrary.MyFunctions..ctor()\r\n   at lambda_method(Closure )\r\n   at System.Web.Http.Dispatcher.DefaultHttpControllerActivator.Create(HttpRequestMessage request, HttpControllerDescriptor controllerDescriptor, Type controllerType)"
// }
// }