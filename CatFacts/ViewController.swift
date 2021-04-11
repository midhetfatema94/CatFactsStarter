//
//  ViewController.swift
//  CatFacts
//
//  Created by Midhet Sulemani on 4/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catFact: UILabel!
    @IBOutlet weak var factButton: UIButton!
    
    var facts = [Fact]()
    var pictureCount = 1
    
    @IBAction func nextFactTapped(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCatFacts()
        
        factButton.layer.cornerRadius = 5.0
        factButton.clipsToBounds = true
        
        catImageView.layer.cornerRadius = 5.0
        catImageView.clipsToBounds = true
    }
    
    func loadCatFacts() {
    }
    
    func updateUI() {
        catImageView.image = UIImage(named: "cat\(pictureCount)")
        pictureCount += 1
        if pictureCount > 6 {
            pictureCount = 1
        }
        
        catFact.text = facts[factButton.tag].fact
        factButton.tag += 1
        if factButton.tag >= facts.count {
            factButton.tag = 0
        }
    }
}

extension Bundle {
    func getFileData(_ file: String) -> Data {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        
        return data
    }
}
