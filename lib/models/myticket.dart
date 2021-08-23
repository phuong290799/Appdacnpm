class MyTicket {
  late int maVe;
  late int maNhaXe;
  late String tenKh;
  late String sdt;
  late int maChoNgoi;
  late String tenTuyenXe;
  late String bienSoXe;
  late String ngayDi;
  late double donGia;
   late String ghiChu;
  late bool trangThai;

  MyTicket(
      {required this.maVe,
        required this.maNhaXe,
        required this.tenKh,
        required this.sdt,
        required this.maChoNgoi,
        required this.tenTuyenXe,
        required this.bienSoXe,
        required this.ngayDi,
        required this.donGia,
        required this.ghiChu,
        required this.trangThai});

  MyTicket.fromJson(Map<String, dynamic> json) {
    maVe = json['maVe'];
    maNhaXe = json['maNhaXe'];
    tenKh = json['tenKh'];
    sdt = json['sdt'];
    maChoNgoi = json['maChoNgoi'];
    tenTuyenXe = json['tenTuyenXe'];
    bienSoXe = json['bienSoXe'];
    ngayDi = json['ngayDi'];
    donGia = json['donGia'];
    ghiChu = json['ghiChu'];
    trangThai = json['trangThai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maVe'] = this.maVe;
    data['maNhaXe'] = this.maNhaXe;
    data['tenKh'] = this.tenKh;
    data['sdt'] = this.sdt;
    data['maChoNgoi'] = this.maChoNgoi;
    data['tenTuyenXe'] = this.tenTuyenXe;
    data['bienSoXe'] = this.bienSoXe;
    data['ngayDi'] = this.ngayDi;
    data['donGia'] = this.donGia;
    data['ghiChu'] = this.ghiChu;
    data['trangThai'] = this.trangThai;
    return data;
  }
}
