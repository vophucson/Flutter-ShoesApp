class Config {
  static String url = 'http://10.0.2.2:3000/';
  static String login = 'api/login';
  static String register = 'Api/register/';
  static String category = 'Api/Category/';
  static String allCategory = 'GetAllCategory/';
  static String product = 'Api/Product/';
  static String allProduct = 'GetAllProduct';
  static String viewProductdetail = 'ViewProductDetail?productId=';
  static String viewcategoryproduct = 'GetProductById?categoryId=';
  static String addtocart = '/AddToCart';
  static String order = 'api/order';
  static String viewCart = '/viewCart?userId=';
  static String Search = 'SearchProduct/?productName=';
  static String checkout = '/checkOut';
  static String deleteCart = "/deleteCart?orderId=";
  static String orderHistory = '/orderHistory?userId=';
  static String orderHisstoryDetail = '/orderHistoryDetail?orderId=';
  static String user = 'api/users';
  static String changePassword = '/changePassword';
  static String IdUser = "/getUserById?id=";
  static String updateProfile = "/updateUser";
  static String review = "api/review";
  static String getReview = "/getReview?productId=";
  static String sendReview = "/sendReview";
  static String banner = "api/banner/getAllBanner";
  static String ship = 'api/Ship';
  static String getShipService = '/getShipService';
  static String shipper ='api/shipper';
  static String shipperOrder ='/shipperOrder?shipperId=';
  static String shipperOrderDetail = '/shipperOrderDetail?orderId=';
  static String pickUpOrder = '/pickupOrder';
  static String finishOrder ='/finishOrder';
  static String cancelOrder ='/cancelOrder';
}
