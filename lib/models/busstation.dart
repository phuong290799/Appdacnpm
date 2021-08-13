class BusStation {
  late int maBx;
  late String tenBx;

  BusStation({required this.maBx, required this.tenBx});

  BusStation.fromJson(Map<String, dynamic> json) {
    maBx = json['maBx'];
    tenBx = json['tenBx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maBx'] = this.maBx;
    data['tenBx'] = this.tenBx;
    return data;
  }
}
