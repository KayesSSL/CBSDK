import Foundation

struct MethodDetails {
    var methodName: String?
    var clientId: String?
    var clientSecret: String?
    var guId: String?
    var mobileNumber: String?
    var nidNumber: String?
    var transactionAmount: String?
    var registrationArguments: RegistrationArguments?

    func toJson() -> [String: Any?] {
        var data: [String: Any?] = [
            "methodName": methodName,
            "clientId": clientId,
            "clientSecret": clientSecret,
            "guId": guId,
            "mobileNumber": mobileNumber,
            "nidNumber": nidNumber,
            "amount": transactionAmount
        ]

        if let registrationData = registrationArguments?.toJson() {
            data["registrationArguments"] = registrationData
        }

        return data
    }
}

public struct RegistrationArguments {
    var mobileNo: String?
    var nidNo: String?
    var dob: String?
    var businessType: BusinessType?
    var gender: Gender?
    var shopName: String?
    var emailAddress: String?
    var contactNo: String?
    var tradeLicenseNo: String?
    var tradeLicenseExp: String?
    var tin: String?
    var bin: String?
    
    public  init(mobileNo: String? = nil, nidNo: String? = nil, dob: String? = nil, businessType: BusinessType? = nil, gender: Gender? = nil, shopName: String? = nil, emailAddress: String? = nil, contactNo: String? = nil, tradeLicenseNo: String? = nil, tradeLicenseExp: String? = nil, tin: String? = nil, bin: String? = nil) {
         self.mobileNo = mobileNo
         self.nidNo = nidNo
         self.dob = dob
         self.businessType = businessType
         self.gender = gender
         self.shopName = shopName
         self.emailAddress = emailAddress
         self.contactNo = contactNo
         self.tradeLicenseNo = tradeLicenseNo
         self.tradeLicenseExp = tradeLicenseExp
         self.tin = tin
         self.bin = bin
     }

    func toJson() -> [String: String] {
        var data: [String: String] = [:]

        if let mobileNo = mobileNo { data["MobileNo"] = mobileNo }
        if let nidNo = nidNo { data["NidNo"] = nidNo }
        if let dob = dob { data["DOB"] = dob }
        if let businessType = businessType { data["BusinessType"] = businessType.toDisplayString() }
        if let gender = gender { data["Gender"] = gender.toDisplayString() }
        if let shopName = shopName { data["ShopName"] = shopName }
        if let emailAddress = emailAddress { data["EmailAddress"] = emailAddress }
        if let contactNo = contactNo { data["ContactNo"] = contactNo }
        if let tradeLicenseNo = tradeLicenseNo { data["TradeLicenseNo"] = tradeLicenseNo }
        if let tradeLicenseExp = tradeLicenseExp { data["TradeLicenseExp"] = tradeLicenseExp }
        if let tin = tin { data["TIN"] = tin }
        if let bin = bin { data["BIN"] = bin }

        return data
    }
}

public enum BusinessType: String {
    case personal = "Personal"
    case business = "Business"

    func toDisplayString() -> String? {
        switch self {
        case .personal:
            return "Personal Retail Account (PRA)"
        case .business:
            return "Business"
        }
    }
}

public enum Gender: String {
    case male = "Male"
    case female = "Female"
    case other = "Other"

    func toDisplayString() -> String? {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .other:
            return "Other"
        }
    }
}
