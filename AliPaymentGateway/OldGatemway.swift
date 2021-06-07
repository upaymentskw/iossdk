////
////  OldGatemway.swift
////  AliPaymentGateway
////
////  Created by Mohammad Astafa Khan on 16/03/21.
////
//
//import Foundation
//
//import Foundation
////import MFSDK
////import MFSDK.Swift
//import SafariServices
//import UIKit
//import WebKit
//
////! Project version number for MFSDK.
////public var MFSDKVersionNumber: Double
////@objcMembers @objc
//
//
//@objc public enum MFAPILanguage : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case arabic
//
//    case english
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFAPILanguage.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFAPILanguage.RawValue)
//}
//
//extension MFAPILanguage : Equatable {
//}
//
//extension MFAPILanguage : Hashable {
//}
//
//@objcMembers @objc public class MFCardInfo : NSObject {
//
//    @objc public var bypass: Bool
//
//    @objc public init(cardNumber: String, cardExpiryMonth: String, cardExpiryYear: String, cardHolderName: String, cardSecurityCode: String, saveToken: Bool)
//
//    @objc public init(cardNumber: String, cardExpiryMonth: String, cardExpiryYear: String, cardHolderName: String, cardSecurityCode: String)
//
//    @objc public init(cardToken: String)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFCardInfoResponse : NSObject, Codable {
//
//    @objc final public let recurringId: String?
//
//    @objc final public let token: String?
//
//    @objc final public let cardInfo: MFSDK.Card?
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objc public class MFConstants : NSObject {
//
//    @objc public static let paymentId: String
//
//    @objc public static let applePayNotificationName: String
//
//    @objc override dynamic public init()
//}
//
//@objc public enum MFCurrencyISO : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case kuwait_KWD
//
//    case saudiArabia_SAR
//
//    case bahrain_BHD
//
//    case uAE_AED
//
//    case qatar_QAR
//
//    case oman_MOR
//
//    case jordan_JOD
//
//    case unitedStates_USD
//
//    case euro_EUR
//
//    case Cuban_Convertible_Peso_CUC
//
//    case Falkland_Islands_Pound_FKP
//
//    case Indonesian_Rupiah_IDR
//
//    case Brazilian_Real_BRL
//
//    case Costa_Rican_Colón_CRC
//
//    case Maldivian_Rufiyaa_MVR
//
//    case Brunei_Dollar_BND
//
//    case Romanian_Leu_RON
//
//    case Yemeni_Rial_YER
//
//    case Lesotho_Loti_LSL
//
//    case Mongolian_Tugrik_MNT
//
//    case Papua_New_Guinean_Kina_PGK
//
//    case Liberian_Dollar_LRD
//
//    case Venezuelan_Bolívar_Soberano_VES
//
//    case Cape_Verdean_Escudo_CVE
//
//    case Palladium_Ounce_XPD
//
//    case Haitian_Gourde_HTG
//
//    case Saint_Helena_Pound_SHP
//
//    case Kenyan_Shilling_KES
//
//    case Moldovan_Leu_MDL
//
//    case Kyrgystani_Som_KGS
//
//    case New_Zealand_Dollar_NZD
//
//    case Jersey_Pound_JEP
//
//    case Macanese_Pataca_MOP
//
//    case Moroccan_Dirham_MAD
//
//    case Ethiopian_Birr_ETB
//
//    case Turkish_Lira_TRY
//
//    case Zambian_Kwacha_ZMW
//
//    case East_Caribbean_Dollar_XCD
//
//    case Libyan_Dinar_LYD
//
//    case Sudanese_Pound_SDG
//
//    case Tanzanian_Shilling_TZS
//
//    case Vanuatu_Vatu_VUV
//
//    case Platinum_Ounce_XPT
//
//    case Fijian_Dollar_FJD
//
//    case SaoTomAndPrincipeDobraSTD
//
//    case Polish_Zloty_PLN
//
//    case Canadian_Dollar_CAD
//
//    case Guernsey_Pound_GGP
//
//    case Chilean_Unit_of_Account_UF_CLF
//
//    case Eritrean_Nakfa_ERN
//
//    case Somali_Shilling_SOS
//
//    case Botswanan_Pula_BWP
//
//    case Belize_Dollar_BZD
//
//    case Salvadoran_Colón_SVC
//
//    case São_Tomé_and_Príncipe_Dobra_STN
//
//    case Azerbaijani_Manat_AZN
//
//    case Barbadian_Dollar_BBD
//
//    case Mauritian_Rupee_MUR
//
//    case Special_Drawing_Rights_XDR
//
//    case Laotian_Kip_LAK
//
//    case Swazi_Lilangeni_SZL
//
//    case Czech_Republic_Koruna_CZK
//
//    case Mexican_Peso_MXN
//
//    case CFP_Franc_XPF
//
//    case Jamaican_Dollar_JMD
//
//    case Burundian_Franc_BIF
//
//    case Gibraltar_Pound_GIP
//
//    case Namibian_Dollar_NAD
//
//    case Syrian_Pound_SYP
//
//    case Surinamese_Dollar_SRD
//
//    case CFA_Franc_BEAC_XAF
//
//    case North_Korean_Won_KPW
//
//    case Norwegian_Krone_NOK
//
//    case Singapore_Dollar_SGD
//
//    case Bhutanese_Ngultrum_BTN
//
//    case Chinese_Yuan_CNY
//
//    case Malaysian_Ringgit_MYR
//
//    case Afghan_Afghani_AFN
//
//    case BosniaHerzegovinaConvertibleMarkBAM
//
//    case Danish_Krone_DKK
//
//    case South_Korean_Won_KRW
//
//    case Chilean_Peso_CLP
//
//    case Guatemalan_Quetzal_GTQ
//
//    case Serbian_Dinar_RSD
//
//    case Turkmenistani_Manat_TMT
//
//    case Armenian_Dram_AMD
//
//    case MauritanianOuguiyaMRO
//
//    case Solomon_Islands_Dollar_SBD
//
//    case Belarusian_Ruble_BYN
//
//    case Bangladeshi_Taka_BDT
//
//    case Malawian_Kwacha_MWK
//
//    case Pakistani_Rupee_PKR
//
//    case South_African_Rand_ZAR
//
//    case Zimbabwean_Dollar_ZWL
//
//    case Bolivian_Boliviano_BOB
//
//    case Gold_Ounce_XAU
//
//    case Trinidad_and_Tobago_Dollar_TTD
//
//    case Peruvian_Nuevo_Sol_PEN
//
//    case Australian_Dollar_AUD
//
//    case Sri_Lankan_Rupee_LKR
//
//    case Sierra_Leonean_Leone_SLL
//
//    case Israeli_New_Sheqel_ILS
//
//    case Bitcoin_BTC
//
//    case Lebanese_Pound_LBP
//
//    case Rwandan_Franc_RWF
//
//    case Croatian_Kuna_HRK
//
//    case Honduran_Lempira_HNL
//
//    case Bermudan_Dollar_BMD
//
//    case Venezuelan_Bolívar_Fuerte_Old_VEF
//
//    case Congolese_Franc_CDF
//
//    case Guinean_Franc_GNF
//
//    case Indian_Rupee_INR
//
//    case British_Pound_Sterling_GBP
//
//    case Samoan_Tala_WST
//
//    case Netherlands_Antillean_Guilder_ANG
//
//    case Manx_pound_IMP
//
//    case Nicaraguan_Córdoba_NIO
//
//    case Algerian_Dinar_DZD
//
//    case South_Sudanese_Pound_SSP
//
//    case Swiss_Franc_CHF
//
//    case Bulgarian_Lev_BGN
//
//    case Egyptian_Pound_EGP
//
//    case Cayman_Islands_Dollar_KYD
//
//    case Mauritanian_Ouguiya_MRU
//
//    case Japanese_Yen_JPY
//
//    case Philippine_Peso_PHP
//
//    case Paraguayan_Guarani_PYG
//
//    case Swedish_Krona_SEK
//
//    case Cuban_Peso_CUP
//
//    case Hong_Kong_Dollar_HKD
//
//    case Iraqi_Dinar_IQD
//
//    case Dominican_Peso_DOP
//
//    case Kazakhstani_Tenge_KZT
//
//    case Hungarian_Forint_HUF
//
//    case Nigerian_Naira_NGN
//
//    case New_Taiwan_Dollar_TWD
//
//    case Nepalese_Rupee_NPR
//
//    case Ugandan_Shilling_UGX
//
//    case Silver_Ounce_XAG
//
//    case Angolan_Kwanza_AOA
//
//    case Comorian_Franc_KMF
//
//    case Myanma_Kyat_MMK
//
//    case CFA_Franc_BCEAO_XOF
//
//    case Georgian_Lari_GEL
//
//    case Gambian_Dalasi_GMD
//
//    case Seychellois_Rupee_SCR
//
//    case Tunisian_Dinar_TND
//
//    case Cambodian_Riel_KHR
//
//    case Chinese_Yuan_Offshore_CNH
//
//    case Argentine_Peso_ARS
//
//    case Tajikistani_Somoni_TJS
//
//    case Russian_Ruble_RUB
//
//    case Ghanaian_Cedi_GHS
//
//    case Guyanaese_Dollar_GYD
//
//    case Djiboutian_Franc_DJF
//
//    case Mozambican_Metical_MZN
//
//    case Ukrainian_Hryvnia_UAH
//
//    case Bahamian_Dollar_BSD
//
//    case Aruban_Florin_AWG
//
//    case Vietnamese_Dong_VND
//
//    case Icelandic_Króna_ISK
//
//    case Uzbekistan_Som_UZS
//
//    case Thai_Baht_THB
//
//    case Uruguayan_Peso_UYU
//
//    case Macedonian_Denar_MKD
//
//    case Malagasy_Ariary_MGA
//
//    case Colombian_Peso_COP
//
//    case Panamanian_Balboa_PAB
//
//    case Iranian_Rial_IRR
//
//    case TonganPangaTOP
//
//    case Albanian_Lek_ALL
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFCurrencyISO.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFCurrencyISO.RawValue)
//}
//
//extension MFCurrencyISO : Equatable {
//}
//
//extension MFCurrencyISO : Hashable {
//}
//
//@objcMembers @objc public class MFCustomerAddress : NSObject {
//
//    @objc public var block: String
//
//    @objc public var street: String
//
//    @objc public var houseBuildingNo: String
//
//    @objc public var address: String
//
//    @objc public var addressInstructions: String
//
//    @objc public init(block: String, street: String, houseBuildingNo: String, address: String, addressInstructions: String)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFDirectPaymentResponse : NSObject {
//
//    @objc final public let getPaymentStatusResponse: MFSDK.MFPaymentStatusResponse?
//
//    @objc final public let cardInfoResponse: MFSDK.MFCardInfoResponse?
//
//    @objc public init(getPaymentStatusResponse: MFSDK.MFPaymentStatusResponse, cardInfoResponse: MFSDK.MFCardInfoResponse)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFExecutePaymentRequest : NSObject {
//
//    @objc public var customerName: String
//
//    @objc public var customerCivilId: String
//
//    @objc public var customerReference: String
//
//    @objc public var customerEmail: String
//
//    @objc public var customerMobile: String
//
//    @objc public var invoiceItems: [MFSDK.MFProduct]
//
//    @objc public var language: MFSDK.MFLanguage
//
//    @objc public var expiryDate: Date?
//
//    @objc public var customerAddress: MFSDK.MFCustomerAddress?
//
//    @objc public var userDefinedField: String
//
//    @objc public var displayCurrencyIso: MFSDK.MFCurrencyISO
//
//    @objc public var mobileCountryCode: MFSDK.MFMobileCountryCodeISO.RawValue
//
//    @available(*, deprecated, renamed: "suppliers", message: "Please use 'suppliers' array property instead")
//    @objc public var supplierCode: Int
//
//    @available(*, deprecated, renamed: "suppliers", message: "Please use 'suppliers' array property instead")
//    @objc public var supplierValue: Decimal
//
//    @objc public var suppliers: [MFSDK.MFSupplier]
//
//    @objc public init(invoiceValue: Decimal, paymentMethod: Int, callBackUrl: String, errorUrl: String)
//
//    @objc public init(invoiceValue: Decimal, paymentMethod: Int)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFFailResponse : NSObject, Error {
//
//    @objc final public let statusCode: Int
//
//    @objc final public let errorDescription: String
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFInitiatePaymentRequest : NSObject {
//
//    @objc public init(invoiceAmount: Decimal, currencyIso: MFSDK.MFCurrencyISO)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFInitiatePaymentResponse : NSObject, Codable {
//
//    @objc public var paymentMethods: [MFSDK.MFPaymentMethod]?
//
//    @objc override dynamic public init()
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objcMembers @objc public class MFInvoiceItem : NSObject, Codable {
//
//    @objc final public let itemName: String
//
//    @objc final public let quantity: Int
//
//    @objc final public let unitPrice: Decimal
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objc public class MFInvoiceTransaction : NSObject, Codable {
//
//    final public let transactionDate: String?
//
//    final public let paymentGateway: String?
//
//    final public let referenceID: String?
//
//    final public let trackID: String?
//
//    final public let transactionID: String?
//
//    final public let paymentID: String?
//
//    final public let authorizationID: String?
//
//    final public let transactionStatus: String?
//
//    final public let transationValue: String?
//
//    final public let customerServiceCharge: String?
//
//    final public let dueValue: String?
//
//    final public let paidCurrency: String?
//
//    final public let paidCurrencyValue: String?
//
//    final public let currency: String?
//
//    final public let error: String?
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objc public enum MFKeyType : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case invoiceId
//
//    case paymentId
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFKeyType.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFKeyType.RawValue)
//}
//
//extension MFKeyType : Equatable {
//}
//
//extension MFKeyType : Hashable {
//}
//
//@objc public enum MFLanguage : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case arabic
//
//    case english
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFLanguage.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFLanguage.RawValue)
//}
//
//extension MFLanguage : Equatable {
//}
//
//extension MFLanguage : Hashable {
//}
//
//@objc public enum MFMobileCountryCodeISO : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case kuwait
//
//    case saudiArabia
//
//    case bahrain
//
//    case uAE
//
//    case qatar
//
//    case oman
//
//    case jordan
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFMobileCountryCodeISO.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFMobileCountryCodeISO.RawValue)
//}
//
//extension MFMobileCountryCodeISO : Equatable {
//}
//
//extension MFMobileCountryCodeISO : Hashable {
//}
//
//@objc public enum MFNotificationOption : Int, RawRepresentable, CaseIterable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case all
//
//    case email
//
//    case sms
//
//    case link
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFNotificationOption.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFNotificationOption.RawValue)
//
//    /// A type that can represent a collection of all values of this type.
//    public typealias AllCases = [MFSDK.MFNotificationOption]
//
//    /// A collection of all values of this type.
//    public static var allCases: [MFSDK.MFNotificationOption] { get }
//}
//
//extension MFNotificationOption : Equatable {
//}
//
//extension MFNotificationOption : Hashable {
//}
//
//@objcMembers @objc public class MFPaymentMethod : NSObject, Codable {
//
//    @objc public var paymentMethodId: Int
//
//    @objc public var paymentMethodAr: String?
//
//    @objc public var paymentMethodEn: String?
//
//    @objc public var isDirectPayment: Bool
//
//    @objc public var serviceCharge: Decimal
//
//    @objc public var totalAmount: Decimal
//
//    @objc public var currencyIso: String?
//
//    @objc public var imageUrl: String?
//
//    @objc public var paymentMethodCode: String
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objc public enum MFPaymentMethodCode : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case amex
//
//    case sadad
//
//    case benefit
//
//    case uaeDebitCards
//
//    case qatarDebitCards
//
//    case mada
//
//    case kfast
//
//    case knet
//
//    case applePay
//
//    case afs
//
//    case visaMASTER
//
//    case stcPay
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFPaymentMethodCode.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFPaymentMethodCode.RawValue)
//}
//
//extension MFPaymentMethodCode : Equatable {
//}
//
//extension MFPaymentMethodCode : Hashable {
//}
//
//@objcMembers @objc public class MFPaymentRequest : NSObject {
//
//    @objc public static let shared: MFSDK.MFPaymentRequest
//
//    @objc override dynamic public init()
//}
//
//extension MFPaymentRequest {
//
//    public func executePayment(request: MFSDK.MFExecutePaymentRequest, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFPaymentStatusResponse, MFSDK.MFFailResponse>, String?) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    public func sendPayment(request: MFSDK.MFSendPaymentRequest, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFSendPaymentResponse, MFSDK.MFFailResponse>) -> ())
//}
//
//extension MFPaymentRequest {
//
//    public func executeRecurringPayment(request: MFSDK.MFExecutePaymentRequest, cardInfo: MFSDK.MFCardInfo, recurringIntervalDays: Int, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFDirectPaymentResponse, MFSDK.MFFailResponse>, String?) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    public func cancelRecurringPayment(recurringId: String, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<Bool, MFSDK.MFFailResponse>) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    public func initiatePayment(request: MFSDK.MFInitiatePaymentRequest, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFInitiatePaymentResponse, MFSDK.MFFailResponse>) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    @available(iOS 9.0, *)
//    @available(iOS, obsoleted: 13.0, message: "Please use 'executeApplePayPayment(request:apiLanguage:completion:)' instead")
//    public func executeApplePayPayment(request: MFSDK.MFExecutePaymentRequest, urlScheme: String, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFPaymentStatusResponse, MFSDK.MFFailResponse>, String?) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    @available(iOS 13.0, *)
//    public func executeApplePayPayment(request: MFSDK.MFExecutePaymentRequest, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFPaymentStatusResponse, MFSDK.MFFailResponse>, String?) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    public func executeDirectPayment(request: MFSDK.MFExecutePaymentRequest, cardInfo: MFSDK.MFCardInfo, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFDirectPaymentResponse, MFSDK.MFFailResponse>, String?) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    public func cancelToken(token: String, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<Bool, MFSDK.MFFailResponse>) -> Void)
//}
//
//extension MFPaymentRequest {
//
//    public func getPaymentStatus(paymentStatus: MFSDK.MFPaymentStatusRequest, apiLanguage: MFSDK.MFAPILanguage, completion: @escaping (Result<MFSDK.MFPaymentStatusResponse, MFSDK.MFFailResponse>) -> ())
//}
//
//@objcMembers @objc public class MFPaymentStatusRequest : NSObject {
//
//    @objc public init(invoiceID: String)
//
//    @objc public init(paymentId: String)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFPaymentStatusResponse : NSObject, Codable {
//
//    final public let invoiceID: Int?
//
//    @objc final public let invoiceStatus: String?
//
//    @objc final public let invoiceReference: String?
//
//    @objc final public let customerReference: String?
//
//    @objc final public let createdDate: String?
//
//    @objc final public let expiryDate: String?
//
//    final public let invoiceValue: Decimal?
//
//    @objc final public let comments: String?
//
//    @objc final public let customerName: String?
//
//    @objc final public let customerMobile: String?
//
//    @objc final public let customerEmail: String?
//
//    @objc final public let userDefinedField: String?
//
//    @objc final public let invoiceDisplayValue: String?
//
//    @objc final public let invoiceItems: [MFSDK.MFInvoiceItem]?
//
//    @objc final public let invoiceTransactions: [MFSDK.MFInvoiceTransaction]?
//
//    @objc final public let suppliers: [MFSDK.MFSupplier]?
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objc public enum MFPaymentype : Int, RawRepresentable {
//
//    /// The raw type that can be used to represent all values of the conforming
//    /// type.
//    ///
//    /// Every distinct value of the conforming type has a corresponding unique
//    /// value of the `RawValue` type, but there may be values of the `RawValue`
//    /// type that don't have a corresponding value of the conforming type.
//    public typealias RawValue = String
//
//    case card
//
//    case token
//
//    /// The corresponding value of the raw type.
//    ///
//    /// A new instance initialized with `rawValue` will be equivalent to this
//    /// instance. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     let selectedSize = PaperSize.Letter
//    ///     print(selectedSize.rawValue)
//    ///     // Prints "Letter"
//    ///
//    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
//    ///     // Prints "true"
//    public var rawValue: MFSDK.MFPaymentype.RawValue { get }
//
//    /// Creates a new instance with the specified raw value.
//    ///
//    /// If there is no value of the type that corresponds with the specified raw
//    /// value, this initializer returns `nil`. For example:
//    ///
//    ///     enum PaperSize: String {
//    ///         case A4, A5, Letter, Legal
//    ///     }
//    ///
//    ///     print(PaperSize(rawValue: "Legal"))
//    ///     // Prints "Optional("PaperSize.Legal")"
//    ///
//    ///     print(PaperSize(rawValue: "Tabloid"))
//    ///     // Prints "nil"
//    ///
//    /// - Parameter rawValue: The raw value to use for the new instance.
//    public init?(rawValue: MFSDK.MFPaymentype.RawValue)
//}
//
//extension MFPaymentype : Equatable {
//}
//
//extension MFPaymentype : Hashable {
//}
//
//@objc @objcMembers public class MFProduct : NSObject {
//
//    @objc public var name: String
//
//    @objc public var unitPrice: Double
//
//    @objc public var quantity: Int
//
//    @objc public init(name: String, unitPrice: Double, quantity: Int)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFSendPaymentRequest : NSObject {
//
//    @objc public var mobileCountryIsoCode: MFSDK.MFMobileCountryCodeISO.RawValue
//
//    @objc public var displayCurrencyIso: MFSDK.MFCurrencyISO
//
//    @objc public var customerCivilId: String
//
//    @objc public var customerReference: String
//
//    @objc public var customerEmail: String
//
//    @objc public var customerMobile: String
//
//    @objc public var invoiceItems: [MFSDK.MFProduct]
//
//    @objc public var language: MFSDK.MFLanguage
//
//    @objc public var expiryDate: Date?
//
//    @objc public var errorUrl: String
//
//    @objc public var customerAddress: MFSDK.MFCustomerAddress?
//
//    @objc public var callBackUrl: String
//
//    @objc public var userDefinedField: String
//
//    @objc public var supplierCode: Int
//
//    @objc public var supplierValue: Decimal
//
//    @objc public init(invoiceValue: Decimal, notificationOption: MFSDK.MFNotificationOption, customerName: String)
//
//    @objc override dynamic public init()
//}
//
//@objcMembers @objc public class MFSendPaymentResponse : NSObject, Codable {
//
//    public var invoiceId: Int?
//
//    @objc public var invoiceURL: String?
//
//    @objc public var customerReference: String?
//
//    @objc public var userDefinedField: String?
//
//    @objc override dynamic public init()
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objcMembers @objc public class MFSettings : NSObject {
//
//    @objc public static let shared: MFSDK.MFSettings
//
//    @objc public func configure(token: String, baseURL: String)
//
//    @objc public func setTheme(theme: MFSDK.MFTheme)
//
//    @objc override dynamic public init()
//}
//
//@objc @objcMembers public class MFSupplier : NSObject, Codable {
//
//    @objc public var supplierCode: Int
//
//    @objc public var proposedShare: Decimal
//
//    @objc public var invoiceShare: Decimal
//
//    @objc public var supplierName: String
//
//    @objc public var depositShare: Decimal
//
//    @objc public init(supplierCode: Int, proposedShare: Decimal, invoiceShare: Decimal)
//
//    @objc override dynamic public init()
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    required public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@objcMembers @objc public class MFTheme : NSObject {
//
//    @objc public var navigationTintColor: UIColor
//
//    @objc public var navigationBarTintColor: UIColor
//
//    @objc public var navigationTitle: String
//
//    @objc public var cancelButtonTitle: String
//
//    @objc public init(navigationTintColor: UIColor, navigationBarTintColor: UIColor, navigationTitle: String, cancelButtonTitle: String)
//
//    @objc override dynamic public init()
//}
//
//extension NSNotification.Name {
//
//    public static let applePayCheck: Notification.Name
//}
//
//extension URL {
//
//    public subscript(queryParam: String) -> String? { get }
//}
//
//@objc extension NSURL {
//
//    @objc dynamic public subscript(queryParam: String) -> String? { get }
//}
//
//extension UINavigationController {
//
//    @objc override dynamic open var shouldAutorotate: Bool { get }
//
//    @objc override dynamic open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation { get }
//
//    @objc override dynamic open var supportedInterfaceOrientations: UIInterfaceOrientationMask { get }
//}
//
