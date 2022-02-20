//
//  ViewController.swift
//  MyFirstAPp
//
//  Created by Giselle Salvador on 2022-02-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var holder: UIView!
    
    
    
    var firstNumber: Float = 0
    var resultNumber = 0
    var currentOperation: Operation?
    
    enum Operation {
        case add, subtract, multiply, divide, root, sqr, cube, exponent, fraction, percentage
    }
    
// creating the result area
    private var resultArea: UILabel! = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Arial", size: 50)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        numberPad()
    }
    
// creating the number and operators area
    
    private func numberPad() {
        let buttonSize = view.frame.size.width / 5
        
     // Operation buttons
        let equalButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(2), y: holder.frame.size.height-buttonSize, width: buttonSize, height: buttonSize))
            equalButton.setTitleColor(.black, for: .normal)
            equalButton.backgroundColor = .systemMint
            equalButton.setTitle("=", for: .normal)
            equalButton.tag = 0
            equalButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
         
            holder.addSubview(equalButton)
        
        let sumButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*5), width: buttonSize, height: buttonSize))
            sumButton.setTitleColor(.black, for: .normal)
            sumButton.backgroundColor = .systemTeal
            sumButton.setTitle("+", for: .normal)
            sumButton.tag = 1
            sumButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(sumButton)
        
        let subtractionButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            subtractionButton.setTitleColor(.black, for: .normal)
            subtractionButton.backgroundColor = .systemTeal
            subtractionButton.setTitle("-", for: .normal)
            subtractionButton.tag = 2
            subtractionButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(subtractionButton)
        
        let multiplierButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            multiplierButton.setTitleColor(.black, for: .normal)
            multiplierButton.backgroundColor = .systemTeal
            multiplierButton.setTitle("x", for: .normal)
            multiplierButton.tag = 3
            multiplierButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(multiplierButton)
        
        let dividerButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            dividerButton.setTitleColor(.black, for: .normal)
            dividerButton.backgroundColor = .systemTeal
            dividerButton.setTitle("/", for: .normal)
            dividerButton.tag = 4
            dividerButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(dividerButton)
        
        let squareButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(3), y: holder.frame.size.height-buttonSize, width: buttonSize, height: buttonSize))
            squareButton.setTitleColor(.black, for: .normal)
            squareButton.backgroundColor = .systemTeal
            squareButton.setTitle("x^2", for: .normal)
            squareButton.tag = 5
            squareButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(squareButton)
        
        let cubeButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-buttonSize, width: buttonSize, height: buttonSize))
            cubeButton.setTitleColor(.black, for: .normal)
            cubeButton.backgroundColor = .systemMint
            cubeButton.setTitle("x^3", for: .normal)
            cubeButton.tag = 6
            cubeButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(cubeButton)
        
        let exponentButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            exponentButton.setTitleColor(.black, for: .normal)
            exponentButton.backgroundColor = .systemMint
            exponentButton.setTitle("x^y", for: .normal)
            exponentButton.tag = 7
            exponentButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(exponentButton)
        
        let fractionButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            fractionButton.setTitleColor(.black, for: .normal)
            fractionButton.backgroundColor = .systemMint
            fractionButton.setTitle("1/x", for: .normal)
            fractionButton.tag = 8
            fractionButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(fractionButton)
        
        
        
        let percentageButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*5), width: buttonSize, height: buttonSize))
            percentageButton.setTitleColor(.black, for: .normal)
            percentageButton.backgroundColor = .systemMint
            percentageButton.setTitle("%", for: .normal)
            percentageButton.tag = 9
            percentageButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(percentageButton)
        
        let rootButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(4), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            rootButton.setTitleColor(.black, for: .normal)
            rootButton.backgroundColor = .systemMint
            rootButton.setTitle("sqrt", for: .normal)
            rootButton.tag = 10
            rootButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
            holder.addSubview(rootButton)
        
        
  // Number buttons
        	
        let zeroButton = UIButton(frame: CGRect(x:0, y: holder.frame.size.height-buttonSize, width: buttonSize*2, height: buttonSize))
            zeroButton.setTitleColor(.black, for: .normal)
            zeroButton.backgroundColor = .orange
            zeroButton.setTitle("0", for: .normal)
            zeroButton.tag = 0
            zeroButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            
            holder.addSubview(zeroButton)
        
        let oneButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(0), y: holder.frame.size.height-buttonSize*2, width: buttonSize, height: buttonSize))
            oneButton.setTitleColor(.black, for: .normal)
            oneButton.backgroundColor = .orange
            oneButton.setTitle("1", for: .normal)
            oneButton.tag = 1
            oneButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(oneButton)
        
        let twoButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(1), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            twoButton.setTitleColor(.black, for: .normal)
            twoButton.backgroundColor = .orange
            twoButton.setTitle("2", for: .normal)
            twoButton.tag = 2
            twoButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(twoButton)
    
        let threeButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(2), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            threeButton.setTitleColor(.black, for: .normal)
            threeButton.backgroundColor = .orange
            threeButton.setTitle("3", for: .normal)
            threeButton.tag = 3
            threeButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(threeButton)
        
        let clearButton = UIButton(frame: CGRect(x:0, y: holder.frame.size.height-(buttonSize*5), width: buttonSize*3, height: buttonSize))
            clearButton.setTitleColor(.red, for: .normal)
            clearButton.backgroundColor = .systemMint
            clearButton.setTitle("Clear", for: .normal)
            holder.addSubview(clearButton)
        
      
   // for loops used to avoid repetions on button numbers from 4 to 9
        for i in 4..<7{
        
            let thrirdLineButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(i-4), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            thrirdLineButton.setTitleColor(.black, for: .normal)
            thrirdLineButton.backgroundColor = .orange
            thrirdLineButton.setTitle("\(i)", for: .normal)
            thrirdLineButton.tag = i
            thrirdLineButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(thrirdLineButton)

        }
        
        for i in 7..<10{
        
            let forthLineButton = UIButton(frame: CGRect(x:buttonSize * CGFloat(i-7), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            forthLineButton.setTitleColor(.black, for: .normal)
            forthLineButton.backgroundColor = .orange
            forthLineButton.setTitle("\(i)", for: .normal)
            forthLineButton.tag = i
            forthLineButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(forthLineButton)

        }
        
        resultArea.frame = CGRect(x: 40, y: clearButton.frame.origin.y - 100.0, width: view.frame.size.width - 40, height: 100)
        holder.addSubview(resultArea)
        
// Actions
        
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
    }
    
    @objc func clearResult(){
        resultArea.text = "0"
        currentOperation = nil
        firstNumber = 0
        
    }
    
    @objc func numberPressed(_ sender: UIButton){
        let tag = sender.tag
        
        if resultArea.text == "0"{
            resultArea.text = "\(tag)"
        } else if let operations = resultArea.text {
            resultArea.text = "\(operations)\(tag)"
        }
        
        
    }
    
    @objc func operationPressed(_ sender: UIButton){
        let tag = sender.tag
        
        if let text = resultArea.text, let value  = Float(text), firstNumber == 0.0 {
            firstNumber = value
            resultArea.text = "0"
        }
        
        if tag == 0 {
            if let operation = currentOperation{
                var secondNumber: Float = 0
                if let text = resultArea.text, let value = Float(text){
                    secondNumber = value
                }
                switch operation {
                case .add:
                    let result = firstNumber + secondNumber
                    resultArea.text = "\(result)"
                    break
                case .subtract:
                    let result = firstNumber - secondNumber
                    resultArea.text = "\(result)"
                    break
                case .multiply:
                    let result = firstNumber * secondNumber
                    resultArea.text = "\(result)"
                    break
                case .divide:
                    if secondNumber > 0{
                    let result = firstNumber / secondNumber
                    resultArea.text = "\(result)"
                    } else {
                        resultArea.text = "error "
                    }
                    break
                case .root:
                    if firstNumber > 0{
                    let result = sqrt(firstNumber)
                    resultArea.text = "\(result)"
                    } else {
                        resultArea.text = "error "
                    }
                    break
                case .sqr:
                    secondNumber = firstNumber
                    let result = firstNumber * firstNumber
                    resultArea.text = "\(result)"
                    break
                case .cube:
                    let result = firstNumber * firstNumber * firstNumber
                    resultArea.text = "\(result)"
                    break
                case .exponent:
                    let result = pow(firstNumber, secondNumber)
                    resultArea.text = "\(result)"
                    break
                case .fraction:
                    let result = 1 / firstNumber
                    resultArea.text = "\(result)"
                    break
                case .percentage:
                    let result = (firstNumber/100) * secondNumber
                    resultArea.text = "\(result)"
                    break
                
                }
            }
            
        } else if tag == 1{
            currentOperation = .add
            
        } else if tag == 2{
            currentOperation = .subtract
            
        } else if tag == 3{
            currentOperation = .multiply
            
        } else if tag == 4{
            currentOperation = .divide
            
        } else if tag == 5 {
            currentOperation = .sqr
            
        } else if tag == 6 {
            currentOperation = .cube
            
        } else if tag == 7 {
            currentOperation = .exponent
            
        } else if tag == 8 {
            currentOperation = .fraction
            
        } else if tag == 9 {
            currentOperation = .percentage
            
        } else if tag == 10{
            currentOperation = .root
            
        }
        
    }
}

