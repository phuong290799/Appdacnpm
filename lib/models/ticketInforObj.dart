import 'package:ticketapp/Models/SeatInfor.dart';

class TicketInforObj{
  late String nhaxe, noidi, noiden, giodi, gioden, day;
  late double giatien;
  late List<SeatInfor> listcho=[];
  TicketInforObj(this.nhaxe,this.noidi,this.noiden,this.giodi,this.gioden,this.giatien,this.day,this.listcho);

}