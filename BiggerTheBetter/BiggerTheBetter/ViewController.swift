//
//  ViewController.swift
//  BiggerTheBetter
//
//  Created by Derrick Park on 2018-10-01.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var leftButton: UIButton!
	@IBOutlet weak var rightButton: UIButton!
	@IBOutlet weak var scoreLabel: UILabel!
	var score: Int = 0
	
	override func viewDidLoad() {
		// when all the views are loaded to the memory.
		// 1. generate 2 random numbers
		generateRandomNumbers()
	}
	
	func generateRandomNumbers() {
		let rand1 = arc4random_uniform(100)
		let rand2 = arc4random_uniform(100)
		
		leftButton.setTitle(String(rand1), for: .normal)
		rightButton.setTitle(String(rand2), for: .normal)
	}
	
	// 2. set button action (tap -> increment score)
	@IBAction func leftButtonClicked(_ sender: UIButton) {
		// 3. check the answer
		checkAnswer(false)
		// 4. update label
		// 1. generate 2 random numbers
		generateRandomNumbers()
	}
	
	@IBAction func rightButtonClicked(_ sender: UIButton) {
		// 3. check the answer
		checkAnswer(true)
		// 1. generate 2 random numbers
		generateRandomNumbers()
	}
	// 3. check the answer
	func checkAnswer(_ rightButt: Bool) {
		// get the value from left and right button
		if let leftNumber = leftButton.titleLabel?.text, let rightNumber = rightButton.titleLabel?.text {
			// check if right butt is clicked
			if rightButt {
				if Int(leftNumber)! < Int(rightNumber)! {
					// correct
					score += 1
				} else {
					// wrong
					score -= 1
				}
			} else {
				if Int(leftNumber)! > Int(rightNumber)! {
					// correct
					score += 1
				} else {
					// wrong
					score -= 1
				}
			}
			// 4. update label
			scoreLabel.text = "Score: \(score)"
		}
	}
}

