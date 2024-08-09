import 'package:image_picker/image_picker.dart';
import 'dart:convert';

PhotoplotJobsubmitModel photoplotJobsubmitModelFromJson(String str) =>
    PhotoplotJobsubmitModel.fromJson(json.decode(str));

String photoplotJobsubmitModelToJson(PhotoplotJobsubmitModel data) => json.encode(data.toJson());

class PhotoplotJobsubmitModel {
  PhotoPlot? photoPlot;
  Subsite? subsite;

  PhotoplotJobsubmitModel({
    this.photoPlot,
    this.subsite,
  });

  factory PhotoplotJobsubmitModel.fromJson(Map<String, dynamic> json) => PhotoplotJobsubmitModel(
        photoPlot: json["photo_plot"] == null ? null : PhotoPlot.fromJson(json["photo_plot"]),
        subsite: json["subsite"] == null ? null : Subsite.fromJson(json["subsite"]),
      );

  Map<String, dynamic> toJson() => {
        "photo_plot": photoPlot?.toJson(),
        "subsite": subsite?.toJson(),
      };
}

class PhotoPlot {
  int? id;
  int? subsite;
  List<ImagePlot>? images;

  PhotoPlot({
    this.id,
    this.subsite,
    this.images,
  });

  factory PhotoPlot.fromJson(Map<String, dynamic> json) => PhotoPlot(
        id: json["id"],
        subsite: json["subsite"],
        images: json["image"] == null ? [] : List<ImagePlot>.from(json["image"]!.map((x) => ImagePlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subsite": subsite,
        "image": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class ImagePlot {
  int? id;
  String? image;
  String? alt;
  String? linkAlt;
  int? subsite;
  XFile? fileUpload;

  ImagePlot({
    this.id,
    this.image,
    this.alt,
    this.linkAlt,
    this.subsite,
    this.fileUpload,
  });

  factory ImagePlot.fromJson(Map<String, dynamic> json) => ImagePlot(
        id: json["id"],
        image: json["image"],
        alt: json["alt"],
        linkAlt: json["link_alt"],
        subsite: json["subsite"],
        fileUpload: json["file_upload"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "alt": alt,
        "link_alt": linkAlt,
        "subsite": subsite,
        "file_upload": fileUpload,
      };
}

class Subsite {
  int? id;
  String? code;
  String? subsiteName;
  String? productType;
  String? workType;
  DateTime? dateInstall;
  DateTime? dateInstallEnd;
  dynamic file;
  bool? confirmPlanning;
  bool? confirmEngineer;
  dynamic commentPlanning;
  dynamic commentEngineer;
  bool? confirmContractor;
  dynamic confirmDateContractor;
  dynamic condition;
  DateTime? dateUse;
  bool? confirmAdminPrepare;
  dynamic commentAdminPrepare;
  bool? confirmAdminProduction;
  dynamic commentAdminProduction;
  String? confirmAdminPonumber;
  dynamic commentAdminPonumber;
  bool? confirmAdminOrder;
  dynamic commentAdminOrder;
  String? confirmAdminInspect;
  dynamic commentAdminInspect;
  dynamic billingCode;
  String? confirmAdminBill;
  dynamic confirmAdminBillDate;
  String? confirmAdminBillingDocument;
  dynamic confirmAdminBillingDocumentDate;
  dynamic commentAdminBill;
  String? billPlace;
  dynamic contractorBillPlaceDate;
  bool? installStatus;
  dynamic commentAdminInstall;
  dynamic adminNumberplan;
  dynamic adminDatehire;
  dynamic adminPonumber;
  dynamic adminDateorder;
  dynamic adminPurchReq;
  dynamic adminPurchDoc;
  dynamic adminSalesDoc;
  String? adminManyPr;
  String? adminRemark;
  String? adminDli;
  dynamic adminCreated;
  dynamic adminCreatedOn;
  dynamic adminBy;
  dynamic adminChangedOn;
  dynamic dateInspect;
  dynamic paperInspect;
  dynamic dateQc;
  dynamic reportQc;
  dynamic dateFix;
  dynamic ordervender;
  dynamic sentDate;
  bool? engineerSendtoContractor;
  bool? engineerContractorFix;
  dynamic dateProductSend;
  String? engineerProjectStatus;
  dynamic deliveryDate;
  bool? engineerComplete;
  DateTime? engineerOfferDate;
  String? contractorAcceptStat;
  bool? contractorFix;
  dynamic planningProductionDate;
  dynamic warrantystart;
  dynamic warrantyout;
  dynamic workStat;
  int? project;
  int? drawingUpload;
  int? contractor;
  int? contractorTeam;
  int? sitename;
  dynamic group;
  dynamic billingCondition;
  String? projectName;
  String? drawingUploadName;
  String? contractorName;
  String? team;
  String? engineerName;
  String? adminName;
  String? shipTo;
  String? soldTo;

  Subsite({
    this.id,
    this.code,
    this.subsiteName,
    this.productType,
    this.workType,
    this.dateInstall,
    this.dateInstallEnd,
    this.file,
    this.confirmPlanning,
    this.confirmEngineer,
    this.commentPlanning,
    this.commentEngineer,
    this.confirmContractor,
    this.confirmDateContractor,
    this.condition,
    this.dateUse,
    this.confirmAdminPrepare,
    this.commentAdminPrepare,
    this.confirmAdminProduction,
    this.commentAdminProduction,
    this.confirmAdminPonumber,
    this.commentAdminPonumber,
    this.confirmAdminOrder,
    this.commentAdminOrder,
    this.confirmAdminInspect,
    this.commentAdminInspect,
    this.billingCode,
    this.confirmAdminBill,
    this.confirmAdminBillDate,
    this.confirmAdminBillingDocument,
    this.confirmAdminBillingDocumentDate,
    this.commentAdminBill,
    this.billPlace,
    this.contractorBillPlaceDate,
    this.installStatus,
    this.commentAdminInstall,
    this.adminNumberplan,
    this.adminDatehire,
    this.adminPonumber,
    this.adminDateorder,
    this.adminPurchReq,
    this.adminPurchDoc,
    this.adminSalesDoc,
    this.adminManyPr,
    this.adminRemark,
    this.adminDli,
    this.adminCreated,
    this.adminCreatedOn,
    this.adminBy,
    this.adminChangedOn,
    this.dateInspect,
    this.paperInspect,
    this.dateQc,
    this.reportQc,
    this.dateFix,
    this.ordervender,
    this.sentDate,
    this.engineerSendtoContractor,
    this.engineerContractorFix,
    this.dateProductSend,
    this.engineerProjectStatus,
    this.deliveryDate,
    this.engineerComplete,
    this.engineerOfferDate,
    this.contractorAcceptStat,
    this.contractorFix,
    this.planningProductionDate,
    this.warrantystart,
    this.warrantyout,
    this.workStat,
    this.project,
    this.drawingUpload,
    this.contractor,
    this.contractorTeam,
    this.sitename,
    this.group,
    this.billingCondition,
    this.projectName,
    this.drawingUploadName,
    this.contractorName,
    this.team,
    this.engineerName,
    this.adminName,
    this.shipTo,
    this.soldTo,
  });

  factory Subsite.fromJson(Map<String, dynamic> json) => Subsite(
        id: json["id"],
        code: json["code"],
        subsiteName: json["subsite_name"],
        productType: json["product_type"],
        workType: json["work_type"],
        dateInstall: json["date_install"] == null ? null : DateTime.parse(json["date_install"]),
        dateInstallEnd: json["date_install_end"] == null ? null : DateTime.parse(json["date_install_end"]),
        file: json["file"],
        confirmPlanning: json["confirm_planning"],
        confirmEngineer: json["confirm_engineer"],
        commentPlanning: json["comment_planning"],
        commentEngineer: json["comment_engineer"],
        confirmContractor: json["confirm_contractor"],
        confirmDateContractor: json["confirm_date_contractor"],
        condition: json["condition"],
        dateUse: json["date_use"] == null ? null : DateTime.parse(json["date_use"]),
        confirmAdminPrepare: json["confirm_admin_prepare"],
        commentAdminPrepare: json["comment_admin_prepare"],
        confirmAdminProduction: json["confirm_admin_production"],
        commentAdminProduction: json["comment_admin_production"],
        confirmAdminPonumber: json["confirm_admin_ponumber"],
        commentAdminPonumber: json["comment_admin_ponumber"],
        confirmAdminOrder: json["confirm_admin_order"],
        commentAdminOrder: json["comment_admin_order"],
        confirmAdminInspect: json["confirm_admin_inspect"],
        commentAdminInspect: json["comment_admin_inspect"],
        billingCode: json["billing_code"],
        confirmAdminBill: json["confirm_admin_bill"],
        confirmAdminBillDate: json["confirm_admin_bill_date"],
        confirmAdminBillingDocument: json["confirm_admin_billing_document"],
        confirmAdminBillingDocumentDate: json["confirm_admin_billing_document_date"],
        commentAdminBill: json["comment_admin_bill"],
        billPlace: json["bill_place"],
        contractorBillPlaceDate: json["contractor_bill_place_date"],
        installStatus: json["install_status"],
        commentAdminInstall: json["comment_admin_install"],
        adminNumberplan: json["admin_numberplan"],
        adminDatehire: json["admin_datehire"],
        adminPonumber: json["admin_ponumber"],
        adminDateorder: json["admin_dateorder"],
        adminPurchReq: json["admin_purch_req"],
        adminPurchDoc: json["admin_purch_doc"],
        adminSalesDoc: json["admin_sales_doc"],
        adminManyPr: json["admin_many_pr"],
        adminRemark: json["admin_remark"],
        adminDli: json["admin_dli"],
        adminCreated: json["admin_created"],
        adminCreatedOn: json["admin_created_on"],
        adminBy: json["admin_by"],
        adminChangedOn: json["admin_changed_on"],
        dateInspect: json["date_inspect"],
        paperInspect: json["paper_inspect"],
        dateQc: json["date_qc"],
        reportQc: json["report_qc"],
        dateFix: json["date_fix"],
        ordervender: json["ordervender"],
        sentDate: json["sent_date"],
        engineerSendtoContractor: json["engineer_sendto_contractor"],
        engineerContractorFix: json["engineer_contractor_fix"],
        dateProductSend: json["date_product_send"],
        engineerProjectStatus: json["engineer_project_status"],
        deliveryDate: json["delivery_date"],
        engineerComplete: json["engineer_complete"],
        engineerOfferDate: json["engineer_offer_date"] == null ? null : DateTime.parse(json["engineer_offer_date"]),
        contractorAcceptStat: json["contractor_accept_stat"],
        contractorFix: json["contractor_fix"],
        planningProductionDate: json["planning_production_date"],
        warrantystart: json["warrantystart"],
        warrantyout: json["warrantyout"],
        workStat: json["work_stat"],
        project: json["project"],
        drawingUpload: json["drawing_upload"],
        contractor: json["contractor"],
        contractorTeam: json["contractor_team"],
        sitename: json["sitename"],
        group: json["group"],
        billingCondition: json["billing_condition"],
        projectName: json["project_name"],
        drawingUploadName: json["drawing_upload_name"],
        contractorName: json["contractor_name"],
        team: json["team"],
        engineerName: json["engineer_name"],
        adminName: json["admin_name"],
        shipTo: json["ship_to"],
        soldTo: json["sold_to"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "subsite_name": subsiteName,
        "product_type": productType,
        "work_type": workType,
        "date_install":
            "${dateInstall!.year.toString().padLeft(4, '0')}-${dateInstall!.month.toString().padLeft(2, '0')}-${dateInstall!.day.toString().padLeft(2, '0')}",
        "date_install_end":
            "${dateInstallEnd!.year.toString().padLeft(4, '0')}-${dateInstallEnd!.month.toString().padLeft(2, '0')}-${dateInstallEnd!.day.toString().padLeft(2, '0')}",
        "file": file,
        "confirm_planning": confirmPlanning,
        "confirm_engineer": confirmEngineer,
        "comment_planning": commentPlanning,
        "comment_engineer": commentEngineer,
        "confirm_contractor": confirmContractor,
        "confirm_date_contractor": confirmDateContractor,
        "condition": condition,
        "date_use":
            "${dateUse!.year.toString().padLeft(4, '0')}-${dateUse!.month.toString().padLeft(2, '0')}-${dateUse!.day.toString().padLeft(2, '0')}",
        "confirm_admin_prepare": confirmAdminPrepare,
        "comment_admin_prepare": commentAdminPrepare,
        "confirm_admin_production": confirmAdminProduction,
        "comment_admin_production": commentAdminProduction,
        "confirm_admin_ponumber": confirmAdminPonumber,
        "comment_admin_ponumber": commentAdminPonumber,
        "confirm_admin_order": confirmAdminOrder,
        "comment_admin_order": commentAdminOrder,
        "confirm_admin_inspect": confirmAdminInspect,
        "comment_admin_inspect": commentAdminInspect,
        "billing_code": billingCode,
        "confirm_admin_bill": confirmAdminBill,
        "confirm_admin_bill_date": confirmAdminBillDate,
        "confirm_admin_billing_document": confirmAdminBillingDocument,
        "confirm_admin_billing_document_date": confirmAdminBillingDocumentDate,
        "comment_admin_bill": commentAdminBill,
        "bill_place": billPlace,
        "contractor_bill_place_date": contractorBillPlaceDate,
        "install_status": installStatus,
        "comment_admin_install": commentAdminInstall,
        "admin_numberplan": adminNumberplan,
        "admin_datehire": adminDatehire,
        "admin_ponumber": adminPonumber,
        "admin_dateorder": adminDateorder,
        "admin_purch_req": adminPurchReq,
        "admin_purch_doc": adminPurchDoc,
        "admin_sales_doc": adminSalesDoc,
        "admin_many_pr": adminManyPr,
        "admin_remark": adminRemark,
        "admin_dli": adminDli,
        "admin_created": adminCreated,
        "admin_created_on": adminCreatedOn,
        "admin_by": adminBy,
        "admin_changed_on": adminChangedOn,
        "date_inspect": dateInspect,
        "paper_inspect": paperInspect,
        "date_qc": dateQc,
        "report_qc": reportQc,
        "date_fix": dateFix,
        "ordervender": ordervender,
        "sent_date": sentDate,
        "engineer_sendto_contractor": engineerSendtoContractor,
        "engineer_contractor_fix": engineerContractorFix,
        "date_product_send": dateProductSend,
        "engineer_project_status": engineerProjectStatus,
        "delivery_date": deliveryDate,
        "engineer_complete": engineerComplete,
        "engineer_offer_date":
            "${engineerOfferDate!.year.toString().padLeft(4, '0')}-${engineerOfferDate!.month.toString().padLeft(2, '0')}-${engineerOfferDate!.day.toString().padLeft(2, '0')}",
        "contractor_accept_stat": contractorAcceptStat,
        "contractor_fix": contractorFix,
        "planning_production_date": planningProductionDate,
        "warrantystart": warrantystart,
        "warrantyout": warrantyout,
        "work_stat": workStat,
        "project": project,
        "drawing_upload": drawingUpload,
        "contractor": contractor,
        "contractor_team": contractorTeam,
        "sitename": sitename,
        "group": group,
        "billing_condition": billingCondition,
        "project_name": projectName,
        "drawing_upload_name": drawingUploadName,
        "contractor_name": contractorName,
        "team": team,
        "engineer_name": engineerName,
        "admin_name": adminName,
        "ship_to": shipTo,
        "sold_to": soldTo,
      };
}
