import RxSwift
import Combine
class StockListViewModel: BaseViewModel  {
    @Published var stocks : [Stock] = []
    @Published var errorMessage : String?
    @Published var loading = false
    @Published var isEmpty = false
    
    var currentStocks : [Stock] = []
    
    let useCase : StockUseCase
    //    var loading : BehaviorSubject<Bool> = .init(value: false)
    //    var errorMessage : BehaviorSubject<String?> = .init(value: nil)
    //    var stocks: BehaviorSubject<[Stock]> = .init(value: [])
    
    func searchQueryChanged(query : String) {
        loading = true
        useCase.fetchStocksPublisher(keywords: query).sink{ [unowned self] completion in
            self.loading = false
            switch completion {
            case .failure(let error ) :
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        }receiveValue: { [unowned self] stockResult in
            self.currentStocks = stockResult.items
            self.stocks = stockResult.items
            
        }.store(in: &subscriber)
    }
    
    
    init(useCase : StockUseCase){
        self.useCase = useCase
        super.init()
        reduce()
    }
    
    func reduce() {
        $stocks.sink{ [unowned self] stocks in
            if stocks.count == 0 {
                self.isEmpty = true
            } else {
                self.isEmpty = false
            }
            
        }.store(in: &subscriber)
    }
    //
    //    func viewDidLoad() {
    //        loading.onNext(true)
    //        useCase.fetchStocksPublisher(keywords: "AMZ").sink{ completion in
    //            self.loading.onNext(false)
    //            switch completion {
    //            case .failure(let error ) :
    //                self.errorMessage.onNext(error.localizedDescription)
    //            case .finished: break
    //            }
    //        } receiveValue: { stockResult in
    //            self.loading.onNext(false)
    //            self.stocks.onNext(stockResult.items)
    //        }.store(in: &subscriber)
    //
    //    }
}

