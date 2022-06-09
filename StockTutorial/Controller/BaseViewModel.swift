import Combine

class BaseViewModel  {
    var subscriber : Set<AnyCancellable> = .init()
    
    init ( ) {
        subscriber = .init()
    }
    
}
