class BusPlace {
  late int maChuyenXe;
  late String tenBxDi;
  late String diaChiBxDi;
  late String tenBxDen;
  late String diaChiBxDen;
  late String tenNhaXe;
  late int soChoNgoi;
  late List<String> ngayXuatBen;
  late int thoiGianDiChuyen;
  late double donGia;

  BusPlace(
      {required this.maChuyenXe,
        required this.tenBxDi,
        required this.diaChiBxDi,
        required this.tenBxDen,
        required this.diaChiBxDen,
        required this.tenNhaXe,
        required this.soChoNgoi,
        required this.ngayXuatBen,
        required this.thoiGianDiChuyen,
        required this.donGia});

  BusPlace.fromJson(Map<String, dynamic> json) {
    maChuyenXe = json['maChuyenXe'];
    tenBxDi = json['tenBxDi'];
    diaChiBxDi = json['diaChiBxDi'];
    tenBxDen = json['tenBxDen'];
    diaChiBxDen = json['diaChiBxDen'];
    tenNhaXe = json['tenNhaXe'];
    soChoNgoi = json['soChoNgoi'];
    ngayXuatBen = json['ngayXuatBen'].cast<String>();
    thoiGianDiChuyen = json['thoiGianDiChuyen'];
    donGia = json['donGia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maChuyenXe'] = this.maChuyenXe;
    data['tenBxDi'] = this.tenBxDi;
    data['diaChiBxDi'] = this.diaChiBxDi;
    data['tenBxDen'] = this.tenBxDen;
    data['diaChiBxDen'] = this.diaChiBxDen;
    data['tenNhaXe'] = this.tenNhaXe;
    data['soChoNgoi'] = this.soChoNgoi;
    data['ngayXuatBen'] = this.ngayXuatBen;
    data['thoiGianDiChuyen'] = this.thoiGianDiChuyen;
    data['donGia'] = this.donGia;
    return data;
  }
}
