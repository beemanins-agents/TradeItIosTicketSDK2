class TradeItInstrumentOrderCapabilities: Codable {
    var instrument: String
    var tradeItSymbol: String?
    var precision: Double?
    var actions: [TradeItInstrumentCapability]
    var expirationTypes: [TradeItInstrumentCapability]
    var priceTypes: [TradeItInstrumentCapability]
    var symbolSpecific: String
}
