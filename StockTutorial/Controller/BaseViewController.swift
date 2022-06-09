import UIKit
import RxSwift
import Combine

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    var subscriber : Set<AnyCancellable> = .init()
    var scrollview : UIScrollView?
    
    func enableScrollWhenKeyboardAppeared(scrollView : UIScrollView) {
        self.scrollview = scrollView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHilde), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    func removeListeners () {
        NotificationCenter.default.removeObserver(self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        configureUI()
    }
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    @objc private func keyboardWillShow(notification : NSNotification) {
        guard let scrollView = scrollview else {
            return
        }
        guard let userinfo = notification.userInfo else {return}
        
        var keyboardFrame : CGRect = (userinfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from : nil)
        
        var contentIntent : UIEdgeInsets = scrollView.contentInset
        contentIntent.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentIntent
    }
    @objc private func keyboardWillHilde(notification : NSNotification) {
        guard let scrollview = scrollview else {
            return
        }
        let contentInset : UIEdgeInsets = .zero
        scrollview.contentInset = contentInset
        
    }
}
