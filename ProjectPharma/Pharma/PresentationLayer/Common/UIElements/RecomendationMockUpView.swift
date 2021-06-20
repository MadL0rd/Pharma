//
//  RecomendationMockUpView.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

class RecomendationMockUpView: UIView {
    
    private var urlImagesArray = [
        "https://s3.images-iherb.com/nwy/nwy11534/w/18.jpg",
        "https://s3.images-iherb.com/flo/flo61435/w/13.jpg",
        "https://s3.images-iherb.com/sww/sww14824/w/11.jpg",
        "https://s3.images-iherb.com/mgf/mgf10186/v/13.jpg",
        "https://s3.images-iherb.com/blb/blb00632/v/13.jpg",
        "https://s3.images-iherb.com/prt/prt13345/v/8.jpg",
        "https://s3.images-iherb.com/veg/veg00854/v/3.jpg",
        "https://s3.images-iherb.com/clf/clf03131/w/16.jpg",
        "https://s3.images-iherb.com/blb/blb00739/l/13.jpg"
    ]
    
    let title = UILabel()
    let imagesStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.labelH2(title)
        title.text = "Дает лучший результат вместе с"
        
        addSubview(imagesStack)
        imagesStack.translatesAutoresizingMaskIntoConstraints = false
        imagesStack.axis = .horizontal
        imagesStack.spacing = 9
        
        setupImages()
        
        makeConstraints()
    }
    
    private func setupImages() {
        let randomCount = Int.random(in: 2 ... 4)
        while urlImagesArray.count > randomCount {
            urlImagesArray.remove(at: Int.random(in: 0 ..< urlImagesArray.count))
        }
        
        urlImagesArray.forEach {
            addImageToStack(imageUrl: $0)
        }
    }
    
    private func addImageToStack(imageUrl: String) {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.setDefaultLoadingInicator()
        imageView.sd_setImage(with: URL(string: imageUrl))
        
        imagesStack.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 82),
            imageView.widthAnchor.constraint(equalToConstant: 82)
        ])
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: title.heightAnchor, constant: 112),
            
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leftAnchor.constraint(equalTo: leftAnchor),
            title.rightAnchor.constraint(equalTo: rightAnchor),
            
            imagesStack.topAnchor.constraint(equalTo: title.topAnchor, constant: 24),
            imagesStack.leftAnchor.constraint(equalTo: leftAnchor),
            imagesStack.heightAnchor.constraint(equalToConstant: 82)
        ])
    }
}
