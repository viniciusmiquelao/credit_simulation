import 'package:intl/intl.dart';

class SimulationResponse {
  String? id;
  String? fullname;
  String? email;
  int? ltv;
  double? contractValue;
  double? netValue;
  double? installmentValue;
  double? lastInstallmentValue;
  double? iofFee;
  double? originationFee;
  int? term;
  String? collateral;
  double? collateralInBrl;
  double? collateralUnitPrice;
  DateTime? firstDueDate;
  DateTime? lastDueDate;
  double? interestRate;
  double? monthlyRate;
  double? annualRate;

  SimulationResponse(
      {this.id,
      this.fullname,
      this.email,
      this.ltv,
      this.contractValue,
      this.netValue,
      this.installmentValue,
      this.lastInstallmentValue,
      this.iofFee,
      this.originationFee,
      this.term,
      this.collateral,
      this.collateralInBrl,
      this.collateralUnitPrice,
      this.firstDueDate,
      this.lastDueDate,
      this.interestRate,
      this.monthlyRate,
      this.annualRate});

  SimulationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    ltv = json['ltv'];
    contractValue = json['contract_value'];
    netValue = json['net_value'];
    installmentValue = json['installment_value'];
    lastInstallmentValue = json['last_installment_value'];
    iofFee = json['iof_fee'];
    originationFee = json['origination_fee'];
    term = json['term'];
    collateral =
        '₿ ' + (json['collateral'] / 100000000).toString().replaceAll('.', ',');
    collateralInBrl = json['collateral_in_brl'];
    collateralUnitPrice = json['collateral_unit_price'];
    firstDueDate =
        DateFormat('yyyy-MM-dd', 'pt_BR').parse(json['first_due_date']);
    lastDueDate =
        DateFormat('yyyy-MM-dd', 'pt_BR').parse(json['last_due_date']);
    interestRate = json['interest_rate'];
    monthlyRate = json['monthly_rate'];
    annualRate = json['annual_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['ltv'] = this.ltv;
    data['contract_value'] = this.contractValue;
    data['net_value'] = this.netValue;
    data['installment_value'] = this.installmentValue;
    data['last_installment_value'] = this.lastInstallmentValue;
    data['iof_fee'] = this.iofFee;
    data['origination_fee'] = this.originationFee;
    data['term'] = this.term;
    data['collateral'] = this.collateral;
    data['collateral_in_brl'] = this.collateralInBrl;
    data['collateral_unit_price'] = this.collateralUnitPrice;
    data['first_due_date'] = this.firstDueDate;
    data['last_due_date'] = this.lastDueDate;
    data['interest_rate'] = this.interestRate;
    data['monthly_rate'] = this.monthlyRate;
    data['annual_rate'] = this.annualRate;
    return data;
  }
}
