//
//  DetailedViewController.swift
//  Assignment3
//
//  Created by yoshizawarei on 2018/10/05.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        navigationController?.navigationBar.topItem?.title = city.name
        let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 200, width: 300, height: 50))
        cityLabel.text = city.name
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 40)
        
        let cityTemp = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 50, width: 300, height: 50))
        cityTemp.text = "Temperature is \(city.temp) degree"
        cityTemp.textAlignment = .center
        cityTemp.font = UIFont(name: "Helvetica Neue", size: 20)
    
        let cityPre = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 25, width: 300, height: 50))
        cityPre.text = "Precipitation is \(city.precipitation)"
        cityPre.textAlignment = .center
        cityPre.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let citySum = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 0, width: 300, height: 50))
        citySum.text = "Summary is \(city.summary)"
        citySum.textAlignment = .center
        citySum.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let cityIcon = UIImage(named: city.icon)
        let cityIconView = UIImageView(image: cityIcon)
        cityIconView.alignmentRect(forFrame: CGRect(x: view.bounds.width / 2, y: view.bounds.height / 2, width: 100, height: 100))
        
        view.addSubview(cityLabel)
        view.addSubview(cityTemp)
        view.addSubview(cityPre)
        view.addSubview(citySum)
        view.addSubview(cityIconView)

        // Do any additional setup after loading the view.
    }

}
