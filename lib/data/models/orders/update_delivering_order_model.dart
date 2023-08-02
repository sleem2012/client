class UpdateDeliveringOrderModel {
  int? shippingId;
  String? state;
  String? canceledReason;
  String? qrClient;
  String? qrVendor;

  UpdateDeliveringOrderModel({
    this.shippingId,
    this.state,
    this.canceledReason,
    this.qrClient,
    this.qrVendor,
  });

  UpdateDeliveringOrderModel.fromJson(Map<String, dynamic> json) {
    shippingId = json['shipping_id'];
    state = json['state'];
    canceledReason = json['canceled_reason'];
    qrClient = json['qr_client'];
    qrVendor = json['qr_vendor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = shippingId;
    if (state != null)  data['state'] = state;
    if (canceledReason != null) data['canceled_reason'] = canceledReason;
    if (qrClient != null) data['qr_client'] = qrClient;
    if (qrVendor != null) data['qr_vendor'] = qrVendor;
    return data;
  }

  UpdateDeliveringOrderModel copyWith({
    int? shippingId,
    int? rider,
    String? state,
    String? canceledReason,
    String? qrClient,
    String? qrVendor,
  }) {
    return UpdateDeliveringOrderModel(
      shippingId: shippingId ?? this.shippingId,
      state: state ?? this.state,
      canceledReason: canceledReason ?? this.canceledReason,
      qrClient: qrClient ?? this.qrClient,
      qrVendor: qrVendor ?? this.qrVendor,
    );
  }
}
