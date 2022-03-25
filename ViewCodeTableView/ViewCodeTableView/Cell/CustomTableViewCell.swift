//
//  CustomTableViewCell.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "swift")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemRed
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.contentMode = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Swift is the best language!"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nibh magna, iaculis id sapien eget, blandit eleifend libero. Pellentesque sed tincidunt metus. Nulla in tristique lorem, id ultricies ante. Suspendisse quis turpis id leo congue euismod at dictum ante. Phasellus nec erat ut nisl tincidunt elementum. Maecenas suscipit nunc ut magna ultricies, vel euismod massa ullamcorper. Sed molestie diam nulla, feugiat fringilla sem rhoncus eu. Vivamus auctor, diam quis convallis cursus, metus felis aliquam diam, id maximus mi magna id justo. Fusce porta varius eros. Sed posuere, elit ut iaculis porta, metus leo rutrum leo, in tincidunt quam nisl non ante. Curabitur tempor risus ut interdum auctor. Vivamus ut aliquet enim."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .systemBackground
    }
    
    private func configUI() {
        backgroundColor = .systemBackground
        
        addSubviews([iconImageView, contentStackView])
        
        configIconImageView()
        configContentStackView()
        configTitleLabel()
    }
    
    private func configIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
    
    private func configContentStackView() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configTitleLabel() {
        
    }
}
