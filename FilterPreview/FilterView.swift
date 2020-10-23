import UIKit

class FilterView: UIView {

    // MARK: - Objects
    lazy var headerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var selectImageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(
                        named: "add")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
        button.tintColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save as copy", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let cell = "FilterCell"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(FilterCell.self,
                                forCellWithReuseIdentifier: cell)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    // MARK: - Setup Methods
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        setupHeaderContainer()
        setupSelectImageButton()
        setupSaveButton()
        setupImageView()
        setupCollectionView()
    }

    // MARK: - Constraints
    private func setupHeaderContainer() {
        addSubview(headerContainer)
        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(equalTo: topAnchor),
            headerContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    private func setupSelectImageButton() {
        headerContainer.addSubview(selectImageButton)
        NSLayoutConstraint.activate([
            selectImageButton.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 4),
            selectImageButton.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 10),
            selectImageButton.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: -4),
            selectImageButton.heightAnchor.constraint(equalToConstant: 40),
            selectImageButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupSaveButton() {
        headerContainer.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 4),
            saveButton.trailingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: -10),
            saveButton.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: -4),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
    }

    private func setupCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
