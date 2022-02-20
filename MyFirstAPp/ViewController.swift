//
//  ViewController.swift
//  MyFirstAPp
//
//  Created by Giselle Salvador on 2022-02-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var holder: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        numberPad()
    }
    
    
    private func numberPad() {
        let buttonSize = view.frame.size.width / 5
        
        
        let zeroButton = UIButton(frame: CGRect(x:0, y: holder.frame.size.height-buttonSize, width: buttonSize*2, height: buttonSize))
            zeroButton.setTitleColor(.black, for: .normal)
            zeroButton.backgroundColor = .orange
            zeroButton.setTitle("0", for: .normal)
            holder.addSubview(zeroButton)
        
        let equalButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(2), y: holder.frame.size.height-buttonSize, width: buttonSize, height: buttonSize))
            equalButton.setTitleColor(.black, for: .normal)
            equalButton.backgroundColor = .systemGreen
            equalButton.setTitle("=", for: .normal)
            holder.addSubview(equalButton)
        
        let oneButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(0), y: holder.frame.size.height-buttonSize*2, width: buttonSize, height: buttonSize))
            oneButton.setTitleColor(.black, for: .normal)
            oneButton.backgroundColor = .orange
            oneButton.setTitle("1", for: .normal)
            holder.addSubview(oneButton)
        
        let twoButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(1), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            twoButton.setTitleColor(.black, for: .normal)
            twoButton.backgroundColor = .orange
            twoButton.setTitle("2", for: .normal)
            holder.addSubview(twoButton)
    
        let threeButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(2), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            threeButton.setTitleColor(.black, for: .normal)
            threeButton.backgroundColor = .orange
            threeButton.setTitle("3", for: .normal)
            holder.addSubview(threeButton)
        
        let clearButton = UIButton(frame: CGRect(x:0, y: holder.frame.size.height-(buttonSize*5), width: buttonSize*3, height: buttonSize))
            clearButton.setTitleColor(.orange, for: .normal)
            clearButton.backgroundColor = .systemGreen
            clearButton.setTitle("Clear", for: .normal)
            holder.addSubview(clearButton)
        
        let sumButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*5), width: buttonSize, height: buttonSize))
            sumButton.setTitleColor(.black, for: .normal)
            sumButton.backgroundColor = .systemTeal
            sumButton.setTitle("+", for: .normal)
            holder.addSubview(sumButton)
        
        let subtractionButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            subtractionButton.setTitleColor(.black, for: .normal)
            subtractionButton.backgroundColor = .systemTeal
            subtractionButton.setTitle("-", for: .normal)
            holder.addSubview(subtractionButton)
        
        let multiplierButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            multiplierButton.setTitleColor(.black, for: .normal)
            multiplierButton.backgroundColor = .systemTeal
            multiplierButton.setTitle("x", for: .normal)
            holder.addSubview(multiplierButton)
        
        let dividerButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            dividerButton.setTitleColor(.black, for: .normal)
            dividerButton.backgroundColor = .systemTeal
            dividerButton.setTitle("/", for: .normal)
            holder.addSubview(dividerButton)
        
        let squareButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-buttonSize, width: buttonSize, height: buttonSize))
            squareButton.setTitleColor(.black, for: .normal)
            squareButton.backgroundColor = .systemTeal
            squareButton.setTitle("x^2", for: .normal)
            holder.addSubview(squareButton)
        
        let cubeButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-buttonSize, width: buttonSize, height: buttonSize))
            cubeButton.setTitleColor(.black, for: .normal)
            cubeButton.backgroundColor = .systemMint
            cubeButton.setTitle("x^3", for: .normal)
            holder.addSubview(cubeButton)
        
        let exponentButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            exponentButton.setTitleColor(.black, for: .normal)
            exponentButton.backgroundColor = .systemMint
            exponentButton.setTitle("x^y", for: .normal)
            holder.addSubview(exponentButton)
        
        let fractionButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            fractionButton.setTitleColor(.black, for: .normal)
            fractionButton.backgroundColor = .systemMint
            fractionButton.setTitle("1/x", for: .normal)
            holder.addSubview(fractionButton)
        
        
        
        let percentageButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*5), width: buttonSize, height: buttonSize))
            percentageButton.setTitleColor(.black, for: .normal)
            percentageButton.backgroundColor = .systemMint
            percentageButton.setTitle("%", for: .normal)
            holder.addSubview(percentageButton)
        
        let rootButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            rootButton.setTitleColor(.black, for: .normal)
            rootButton.backgroundColor = .systemMint
            rootButton.setTitle("sqrt", for: .normal)
            holder.addSubview(rootButton)
        
        
      
        
        for i in 4..<7{
        
            let thrirdLineButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(i-4), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            thrirdLineButton.setTitleColor(.black, for: .normal)
            thrirdLineButton.backgroundColor = .orange
            thrirdLineButton.setTitle("\(i)", for: .normal)
            holder.addSubview(thrirdLineButton)

        }
        
        for i in 7..<10{
        
            let forthLineButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(i-7), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            forthLineButton.setTitleColor(.black, for: .normal)
            forthLineButton.backgroundColor = .orange
            forthLineButton.setTitle("\(i)", for: .normal)
            holder.addSubview(forthLineButton)

        }
}
}
