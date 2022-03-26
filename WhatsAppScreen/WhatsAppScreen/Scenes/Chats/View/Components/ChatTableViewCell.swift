//
//  ChatTableViewCell.swift
//  WhatsAppScreen
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit
import Kingfisher

class ChatTableViewCell: UITableViewCell {

    // MARK: Static Constants
    static let identifier = "ChatTableViewCell"
    
    // MARK: View Components
    lazy var friendImageView: UIImageView! = {
        let imageView = UIImageView(frame: .zero)
        
        imageView.image = UIImage(systemName: "swift")
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius =  40
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var friendContentStackView: UIStackView! = {
        let stackView = UIStackView()
        
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    lazy var friendHeaderContentStackView: UIStackView! = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var friendMessageContentStackView: UIStackView! = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .label
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Public Methods
    func setupUI(friend: Friend) {
        configFriendImageView(with: friend.picture)
        configFriendContentStackView(with: friend)
    }
    
    // MARK: Private Methods for config components

    private func configFriendImageView(with urlString: String) {
        let url = URL(string: urlString)
        friendImageView.kf.setImage(with: url)
        
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            friendImageView.heightAnchor.constraint(equalToConstant: 80),
            friendImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configFriendContentStackView(with friend: Friend) {
        addSubview(friendContentStackView)
        
        NSLayoutConstraint.activate([
            friendContentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            friendContentStackView.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 15),
            friendContentStackView.heightAnchor.constraint(equalToConstant: 80),
            friendContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        friendContentStackView.addArrangedSubview(friendHeaderContentStackView)
        friendContentStackView.addArrangedSubview(friendMessageContentStackView)
        configFriendHeaderContentStackView(with: friend)
        configFriendMessageContentStackView(with: friend)
    }
    
    private func configFriendHeaderContentStackView(with friend: Friend) {
        friendHeaderContentStackView.addArrangedSubview(nameLabel)
        friendHeaderContentStackView.addArrangedSubview(dateLabel)
        
        configNameLabel(with: friend.name)
        configDateLabel(with: friend.latestTimestamp)
    }
    
    private func configFriendMessageContentStackView(with friend: Friend) {
        friendMessageContentStackView.addArrangedSubview(messageLabel)
        
        configMessageLabel(with: friend.lastChat)
    }

    private func configNameLabel(with name: String) {
        nameLabel.text = name
    }
    
    private func configDateLabel(with date: String) {
        dateLabel.text = date
    }
    
    private func configMessageLabel(with message: String) {
        let mockSimbol = ["✓✓ ", "📷 Photo \n", "🎤 3:59 \n", ""].randomElement()
        messageLabel.text = mockSimbol! + message
    }
}
