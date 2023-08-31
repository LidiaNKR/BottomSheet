//
//  BottomSheetTableViewCell.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import UIKit

final class BottomSheetTableViewCell: UITableViewCell {
    //MARK: - Static properties
    ///Идентификатор ячецки
    static let identifier = "CarTableViewCell"
    
    //MARK: - Private properties
    ///Лейбл с названием модели автомобиля
    private let carNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    ///Лейбл с описанием модели автомобиля
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.557, green: 0.341, blue: 0.09, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    ///Картинка с рейтингом автомобиля (количество "звезд")
    private let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "Rating")
        return imageView
    }()
    
    ///Лейбл с числовым значением рейтинга автомобиля
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    ///Лейбл с количетвом оценок автомобиля
    private let ratingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.557, green: 0.341, blue: 0.09, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    ///Лейбл с ценой автомобиля в сутки
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    ///Кнопка "Забронировать автомобиль"
    private let bookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 11
        button.setTitle("Забронировать", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor(red: 0.996, green: 0.69, blue: 0.337, alpha: 1)
        return button
    }()
    
    ///Кнопка добавления автомобиля в избранное
    private let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(UIImage(named: "Like"), for: .normal)
        return button
    }()
    
    ///Кнопка удаления автомобиля из списка
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(UIImage(named: "Delete"), for: .normal)
        return button
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0.984, green: 0.969, blue: 0.949, alpha: 1)
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    ///Конфигурация ячейки с помощью данных модели CarModel
    /// - Parameters:
    ///   - car: модель данных CarModel
    func configure(with car: CarModel) {
        carNameLabel.text = car.carName
        descriptionLabel.text = car.description
        ratingLabel.text = String(car.rating)
        ratingCountLabel.text = "\(car.ratingCount) оценок"
        priceLabel.text = "\(car.price) THB/СУТКИ"
    }
    
    // MARK: - Private methods
    ///Установка констрейнтов для элементов ячейки
    private func setUpConstraints() {
        contentView.addSubview(carNameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(ratingImageView)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(ratingCountLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(bookButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            carNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 32
            ),
            carNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: carNameLabel.bottomAnchor,
                constant: 18
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            
            ratingImageView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: 19
            ),
            ratingImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            
            ratingLabel.centerYAnchor.constraint(
                equalTo: ratingImageView.centerYAnchor
            ),
            ratingLabel.leadingAnchor.constraint(
                equalTo: ratingImageView.trailingAnchor,
                constant: 6
            ),
            
            ratingCountLabel.centerYAnchor.constraint(
                equalTo: ratingImageView.centerYAnchor
            ),
            ratingCountLabel.leadingAnchor.constraint(
                equalTo: ratingLabel.trailingAnchor,
                constant: 18
            ),
            
            priceLabel.topAnchor.constraint(
                equalTo: ratingImageView.bottomAnchor,
                constant: 24
            ),
            priceLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            
            bookButton.heightAnchor.constraint(equalToConstant: 54),
            bookButton.topAnchor.constraint(
                equalTo: priceLabel.bottomAnchor,
                constant: 24
            ),
            bookButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            
            likeButton.heightAnchor.constraint(equalToConstant: 35),
            likeButton.widthAnchor.constraint(equalToConstant: 38),
            likeButton.leadingAnchor.constraint(
                equalTo: bookButton.trailingAnchor,
                constant: 21
            ),
            likeButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -30
            ),
            likeButton.centerYAnchor.constraint(
                equalTo: bookButton.centerYAnchor
            ),
            
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            deleteButton.leadingAnchor.constraint(
                equalTo: carNameLabel.trailingAnchor,
                constant: 60
            ),
            deleteButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -30
            ),
            deleteButton.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 38
            )
        ])
    }
}
