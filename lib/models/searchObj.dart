class SearchObj {
  late String noiDen;
  late String noiDi;
  late String ngayDi;

  SearchObj({required this.noiDen, required this.noiDi, required this.ngayDi});

  SearchObj.fromJson(Map<String, dynamic> json) {
    noiDen = json['noiDen'];
    noiDi = json['noiDi'];
    ngayDi = json['ngayDi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noiDen'] = this.noiDen;
    data['noiDi'] = this.noiDi;
    data['ngayDi'] = this.ngayDi;
    return data;
  }
}
