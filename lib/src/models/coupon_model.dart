class CouponModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final String action;
  final double maxDiscount;
  final DateTime endDate;
  final String orderID;
  final String userID;

  CouponModel(this.id, this.name, this.description, this.image, this.action,
      this.maxDiscount, this.endDate, this.orderID, this.userID);
}
