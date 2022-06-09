import UIKit

class StockCell: UITableViewCell {
    
    static let identifier = "StockCellidentifier"
    
    let symbolLabel = TitleLabel()
    let descriptionLabel = NormalGrayLabel()
    let companyNameLabel = NormalLabel()
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            alpha = 0.6
        }else {
            alpha = 1
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(symbolLabel)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(companyNameLabel)
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        symbolLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        symbolLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 12).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: symbolLabel.leftAnchor ).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        companyNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        companyNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        companyNameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true

        
    }
    func configureUI(item : Stock) {
        symbolLabel.text = item.symbol
        descriptionLabel.text = "\(item.type ?? "") \(item.currency ?? "")"
        companyNameLabel.text = item.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
