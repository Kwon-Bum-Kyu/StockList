import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    func start()
}
//class Coordinator {
//    func start(window : UIWindow , rootViewController : UIViewController) {
//        let rootViewController = UINavigationController(rootViewController: rootViewController)
//        window.rootViewController = rootViewController
//        window.makeKeyAndVisible()
//    }
//}
