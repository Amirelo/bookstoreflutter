class OrderModel {
  String id;
  String status;
  double totalPrice;
  DateTime orderDate;
  String userID;
  String couponID;

  OrderModel(this.id, this.status, this.totalPrice, this.orderDate, this.userID,
      this.couponID);
}
