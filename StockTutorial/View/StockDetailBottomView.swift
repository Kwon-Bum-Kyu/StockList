import UIKit

class StockDetailBottomView: BaseView {
    
    let investMentInputView = InputView()
    let costInputView = InputView()
    let dateInputView = InputView()
    let slider = UISlider()
    
    override func configureUI() {
        addSubview(investMentInputView)
        addSubview(costInputView)
        addSubview(dateInputView)
        addSubview(slider)
        
        investMentInputView.translatesAutoresizingMaskIntoConstraints = false
        costInputView.translatesAutoresizingMaskIntoConstraints = false
        dateInputView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        investMentInputView.configureUI(placeHolder: "Enter Your Initial investment amount", descriptionLabelText: "initial investment amount")
        costInputView.configureUI(placeHolder: "Mothly dollar cost averaging amount", descriptionLabelText: "Mothly dollar cost averaging amount")
        dateInputView.configureUI(placeHolder: "Enter Your Initial date of investment", descriptionLabelText: "Enter Your Initial date of investment")
        
        investMentInputView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        investMentInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        investMentInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        investMentInputView.textField.keyboardType = .numberPad
        investMentInputView.textField.addDownButton()
        
        costInputView.topAnchor.constraint(equalTo: investMentInputView.bottomAnchor, constant: 8).isActive = true
        costInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        costInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        costInputView.textField.keyboardType = .numberPad
        costInputView.textField.addDownButton()
        
        dateInputView.topAnchor.constraint(equalTo: costInputView.bottomAnchor, constant: 8).isActive = true
        dateInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        dateInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        slider.topAnchor.constraint(equalTo: dateInputView.bottomAnchor, constant: 8).isActive = true
        slider.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
    }
    
    func configureUI(currency : String){
        investMentInputView.valueLabel.text = "\(currency)"
        costInputView.valueLabel.text = "\(currency)"
        dateInputView.valueLabel.text = "\(currency)"
    }
    
    class InputView: BaseView {
        let textField = UITextField()
        let descriptionLabel = SmallLabel()
        let valueLabel = NormalGrayLabel()
        
        override func configureUI() {
            textField.font = UIFont.systemFont(ofSize: 18)
            textField.autocorrectionType = .no
            
            addSubview(textField)
            addSubview(descriptionLabel)
            addSubview(valueLabel)
            textField.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
            textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            
            descriptionLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            valueLabel.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor).isActive = true
            valueLabel.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 4).isActive = true
            
        }
        
        func configureUI(placeHolder : String, descriptionLabelText : String, value : String? = "") {
            textField.placeholder = placeHolder
            descriptionLabel.text = descriptionLabelText
            valueLabel.text = value
        }
    }
}
