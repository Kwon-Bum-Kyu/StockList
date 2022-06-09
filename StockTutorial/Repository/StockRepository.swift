import Combine

protocol StockRepository{
//    var apiKey : String {get set}
    func fetchStocksPublisher(keywords : String) -> AnyPublisher<StockResult, Error>
    func fetchTimeSeriesPublisher(keywords : String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error>
}
