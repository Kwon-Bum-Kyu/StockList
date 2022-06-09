import UIKit

class StockDetailTopView: BaseView {
    let titleLabel = TitleLabel()
    let subTitleLabel = NormalGrayLabel()
    let currentValueTextLabel = SmallLabel()
    let currentValueValueLabel = TitleLabel()
    let investMentLabel = SmallLabel()
    let investMentValueLabel = SmallBoldLabel()
    let gainLabel = SmallLabel()
    let gainValueLabel = SmallBoldLabel()
    let annualReturnLabel = SmallLabel()
    let annualValueReturnLabel = SmallBoldLabel()
    
    func configureUI (stock : Stock) {
        titleLabel.text = stock.symbol
        subTitleLabel.text = stock.name
        currentValueTextLabel.text = "Current Value (\(stock.currency ?? ""))"
        
    }
    
    override func configureUI() {
        currentValueValueLabel.text = "5000"
        investMentLabel.text = "investment amount"
        investMentValueLabel.text = "USD 100"
        gainLabel.text = "Gain"
        gainValueLabel.text = "+100.25 (+10.25%)"
        annualReturnLabel.text = "annual Return"
        annualValueReturnLabel.text = "+10.5%"
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16 ).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10).isActive = true
        subTitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true

        addSubview(currentValueTextLabel)
        currentValueTextLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueTextLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        currentValueTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
       

        addSubview(currentValueValueLabel)
        currentValueValueLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueValueLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        currentValueValueLabel.topAnchor.constraint(equalTo: currentValueTextLabel.bottomAnchor, constant: 10).isActive = true
        

        addSubview(investMentLabel)
        investMentLabel.translatesAutoresizingMaskIntoConstraints = false
        investMentLabel.topAnchor.constraint(equalTo: currentValueValueLabel.bottomAnchor, constant: 16).isActive = true
        investMentLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(investMentValueLabel)
        investMentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        investMentValueLabel.centerYAnchor.constraint(equalTo: investMentLabel.centerYAnchor).isActive = true
        investMentValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

//        //
        addSubview(gainLabel)
        gainLabel.translatesAutoresizingMaskIntoConstraints = false
        gainLabel.topAnchor.constraint(equalTo: investMentValueLabel.bottomAnchor, constant: 16).isActive = true
        gainLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(gainValueLabel)
        gainValueLabel.translatesAutoresizingMaskIntoConstraints = false
        gainValueLabel.centerYAnchor.constraint(equalTo: gainLabel.centerYAnchor).isActive = true
        gainValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

//
        addSubview(annualReturnLabel)
        annualReturnLabel.translatesAutoresizingMaskIntoConstraints = false
        annualReturnLabel.topAnchor.constraint(equalTo: gainValueLabel.bottomAnchor, constant: 16).isActive = true
        annualReturnLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(annualValueReturnLabel)
        annualValueReturnLabel.translatesAutoresizingMaskIntoConstraints = false
        annualValueReturnLabel.centerYAnchor.constraint(equalTo: annualReturnLabel.centerYAnchor).isActive = true
        annualValueReturnLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        annualValueReturnLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}
