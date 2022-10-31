class ApiConstance{
  static const String baseUrl="http://scopos-khattab.cloud";
  static const String setNewSubBranch="$baseUrl/api/Customer/AddBranch";
  static const String setNewMainBranch="$baseUrl/api/Customer/AddMainCustomer";
  static const String addRegion="$baseUrl/api/Customer/AddRegion";
  static const String addRange="$baseUrl/api/Customer/AddRange";

  static String getRange(String userId)=>"$baseUrl/api/Customer/GetRange?UserID=$userId";

  static String getRegion({required String userId, required String rangeId}) =>
      "$baseUrl/api/Customer/Get_Region?UserID=$userId&Range_Id=$rangeId";

  static String getMainBranches({required String userId}) =>
      "$baseUrl/api/Customer/GetAllMainCus?userID=$userId";

  static String getAllCustomers({required String userId}) =>
      "$baseUrl/api/Sale/GetCusBySearch?UserID=$userId";

  static String getCustomerDetails({required String userId,required String customerId}) =>
      "$baseUrl/api/Sale/GetCusFH?CustomerID=$customerId&userid=$userId";


}
