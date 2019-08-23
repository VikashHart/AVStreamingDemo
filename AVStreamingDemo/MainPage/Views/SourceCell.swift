import UIKit

class SourceCell: UICollectionViewCell {

    lazy var backgroundGradient: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        view.gradientLayer?.colors = CGColor.whites
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var imageBackgroundGradient: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        view.gradientLayer?.colors = CGColor.oranges
        view.gradientLayer?.cornerRadius = 8
        view.gradientLayer?.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "movie_ticket")?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let font = "GillSans-BoldItalic"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: font, size: 25)
        label.textAlignment = .center
        label.textColor = .stone
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        backgroundColor = UIColor.white
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupViews() {
        setupBackgroundGradient()
        setupImageBackgroundGradient()
        setupThumbnailImageView()
        setupTitleLabel()
    }

    private func setupBackgroundGradient() {
        addSubview(backgroundGradient)
        NSLayoutConstraint.activate([
            backgroundGradient.topAnchor.constraint(equalTo: topAnchor),
            backgroundGradient.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundGradient.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundGradient.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    private func setupImageBackgroundGradient() {
        backgroundGradient.addSubview(imageBackgroundGradient)
        NSLayoutConstraint.activate([
            imageBackgroundGradient.topAnchor.constraint(equalTo: backgroundGradient.topAnchor, constant: 10),
            imageBackgroundGradient.leadingAnchor.constraint(equalTo: backgroundGradient.leadingAnchor, constant: 10),
            imageBackgroundGradient.bottomAnchor.constraint(equalTo: backgroundGradient.bottomAnchor, constant: -10),
            imageBackgroundGradient.widthAnchor.constraint(equalTo: backgroundGradient.widthAnchor, multiplier: 0.3),
            imageBackgroundGradient.heightAnchor.constraint(equalTo: imageBackgroundGradient.widthAnchor, multiplier: 1)
            ])
    }

    private func setupThumbnailImageView() {
        imageBackgroundGradient.addSubview(thumbnailImageView)
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: imageBackgroundGradient.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: imageBackgroundGradient.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: imageBackgroundGradient.trailingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: imageBackgroundGradient.bottomAnchor)
            ])
    }

    private func setupTitleLabel() {
        backgroundGradient.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: thumbnailImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundGradient.trailingAnchor, constant: -10)
            ])
    }

    func updateWith(source: SourceModel) {
        self.titleLabel.text = source.title
    }
}
