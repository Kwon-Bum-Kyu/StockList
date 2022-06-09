import Combine

class StockDetailViewModel: BaseViewModel  {
    @Published var loading = false
    @Published var errorMessage : String?
    @Published var timeSeriesMonthlyAdjusted : TimeSeriesMonthlyAdjusted?
    @Published var stock : Stock?
    let usecase: StockDetailUseCase
    
    func viewDidLoad(symbol : String, stock : Stock) {
        self.stock = stock
        loading = true
        usecase.fetchTimeSeriesPublisher(keywords: symbol).sink{completion in
            self.loading = false
            switch completion {
            case .failure(let error) :
                self.errorMessage = error.localizedDescription
            case .finished : break
            }
        } receiveValue: { value in
            var timerSeriesMonthlyAdjusted = value
            timerSeriesMonthlyAdjusted.generateMothlInfo()
            self.timeSeriesMonthlyAdjusted = timerSeriesMonthlyAdjusted
            
        }.store(in: &subscriber)
    }
    
    init(usecase: StockDetailUseCase) {
        self.usecase = usecase
        super.init()
    }
}
