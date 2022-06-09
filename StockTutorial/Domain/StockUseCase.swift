import Foundation
import Combine

class StockUseCase {
    private let stockRepository: StockRepository
    
    func fetchStocksPublisher(keywords : String) -> AnyPublisher<StockResult, Error>{
        return stockRepository.fetchStocksPublisher(keywords: keywords)
    }
    
    init(stockRepository : StockRepository){
        self.stockRepository = stockRepository
    }
}
