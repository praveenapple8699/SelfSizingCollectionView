//
//  ViewController.swift
//  gradientLabel
//
//  Created by Praveen Kumar on 27/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    var randomTexts = [String]()
    	
    @IBOutlet weak var customGradientLabel: GradientLabel!
    
    @IBOutlet weak var randomTextCV: UICollectionView!

    @IBOutlet weak var randomTextCVFL: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomTexts = ["asdasdasd","asdaeadadaadredasdasdadsasdads","asdaskjdbk","pquwroihqwoeh","ambckjbaibaboabds","kahfalfgalfglajfg","asdadsad","asqwqwoiyeqpweuapdsoabsdkjbad","asdadsadskjabsdkabdkabd","asdkabduiavfkab","sdkjmzmxcbzvx","asdlhasjh","piqwpioeiwueyt"]
        
        getRandomTexts()
        
//        randomTexts = ["washier", "nolos", "geopoliticians", "sparer", "clavichordist", "haver", "kith", "starkly", "burgees", "pinballed"]
        
//        customGradientLabel.setUp()
        
        view.backgroundColor = .white
        
        let color1 = UIColor(red: 185/255, green: 43/255, blue: 39/255, alpha: 1).cgColor
        let color2 = UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 1).cgColor
        let color3 = UIColor.yellow.cgColor
        
        randomTextCVFL.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        gradientLayer.colors = [color1,color2,color3]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0.0,0.5,0.80]
//        gradientLayer.frame = gradientLabel.bounds
//        view.layer.addSublayer(gradientLayer)
//        gradientLabel.textColor = .white//UIColor.hexColor(hex: "#b92b27")
        
//        gradientLabel.layer.addSublayer(gradientLayer)
        
    }
    
    func getRandomTexts() {
        
        guard let url = URL(string: "https://random-word-api.herokuapp.com/word?number=10") else { return }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) {[weak self] (data, response, error) in
            
            if error == nil {
                
                if data != nil {
                    
                    do {
                        let model = try JSONDecoder().decode([String].self, from: data!)
                        self?.randomTexts = model
                        self?.updateView()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                
            } else if let err = error {
                print(err.localizedDescription)
            }
            
        }
        
        dataTask.resume()
        
    }
    
    func updateView() {
        
        if Thread.current.isMainThread {
            randomTextCV.reloadData()
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.randomTextCV.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        view.bringSubviewToFront(gradientLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }


}


extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomTexts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RandomTextCVCell.self), for: indexPath) as? RandomTextCVCell
        
        
        cell?.gradientLabel.textLabel.text = "  " + randomTexts[indexPath.item] + "  "
        
        return cell!
        
        
    }
    
    
}
