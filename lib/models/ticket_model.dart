class TicketObj{
  late String nhaxe,bendi,benden,giodi,gioden;
  late int giatien,ghetrong;
  TicketObj(this.nhaxe,this.bendi,this.benden,this.giodi,this.gioden,this.giatien,this.ghetrong);

}




class Ticket_model {
  late int maChuyenXe;
  late String tenBxDi;
  late String diaChiBxDi;
  late String tenBxDen;
  late String diaChiBxDen;
  late String nhaXe;
  late int soChoTrong;
  late String ngayXuatBen;
  late String ngayDen;
  late double donGia;

  Ticket_model(
      {required this.maChuyenXe,
        required this.tenBxDi,
        required this.diaChiBxDi,
        required this.tenBxDen,
        required this.diaChiBxDen,
        required this.nhaXe,
        required this.soChoTrong,
        required this.ngayXuatBen,
        required this.ngayDen,
        required this.donGia});

  Ticket_model.fromJson(Map<String, dynamic> json) {
    maChuyenXe = json['maChuyenXe'];
    tenBxDi = json['tenBxDi'];
    diaChiBxDi = json['diaChiBxDi'];
    tenBxDen = json['tenBxDen'];
    diaChiBxDen = json['diaChiBxDen'];
    nhaXe = json['nhaXe'];
    soChoTrong = json['soChoTrong'];
    ngayXuatBen = json['ngayXuatBen'];
    ngayDen = json['ngayDen'];
    donGia = json['donGia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maChuyenXe'] = this.maChuyenXe;
    data['tenBxDi'] = this.tenBxDi;
    data['diaChiBxDi'] = this.diaChiBxDi;
    data['tenBxDen'] = this.tenBxDen;
    data['diaChiBxDen'] = this.diaChiBxDen;
    data['nhaXe'] = this.nhaXe;
    data['soChoTrong'] = this.soChoTrong;
    data['ngayXuatBen'] = this.ngayXuatBen;
    data['ngayDen'] = this.ngayDen;
    data['donGia'] = this.donGia;
    return data;
  }
}