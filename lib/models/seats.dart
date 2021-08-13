class Seats {
  late int maChoNgoi;
  late bool tinhTrangChoNgoi;

  Seats({required this.maChoNgoi, required this.tinhTrangChoNgoi});

  Seats.fromJson(Map<String, dynamic> json) {
    maChoNgoi = json['maChoNgoi'];
    tinhTrangChoNgoi = json['tinhTrangChoNgoi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maChoNgoi'] = this.maChoNgoi;
    data['tinhTrangChoNgoi'] = this.tinhTrangChoNgoi;
    return data;
  }
}
