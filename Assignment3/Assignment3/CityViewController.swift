//
//  CityViewController.swift
//  Assignment3
//
//  Created by yoshizawarei on 2018/10/05.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    var city: City!
    var detailVC: DetailedViewController?
    
    @objc func showWeatherDetails() {
        detailVC = DetailedViewController()
        detailVC?.city = city
        navigationController?.pushViewController(detailVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.topItem?.title = city.name
        
        let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 200, width: 300, height: 50))
        cityLabel.text = city.name
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 40)
        
        let butt = UIButton(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 25, width: 200, height: 50))
        butt.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        butt.setTitle("See details...", for: .normal)
        butt.layer.cornerRadius = 10.0
        
        butt.addTarget(self, action: #selector(showWeatherDetails), for: .touchUpInside)
        view.addSubview(cityLabel)
        view.addSubview(butt)
    }
    
}
