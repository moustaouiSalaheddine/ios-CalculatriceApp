//
//  CalculatorView.swift
//  Calculatrice App
//
//  Created by Mac  on 30/11/2024.
//
/*
var backgroundColor: Color {
       switch self {
       case .allClear, .clear, .negative, .percent:
           return Color(.lightGray)
       case .operation, .equals:
           return .orange
       case .digit, .decimal:
           return .secondary
       }
   }
   
   var foregroundColor: Color {
       switch self {
       case .allClear, .clear, .negative, .percent:
           return .black
       default:
           return .white
       }
   }
 */
import SwiftUI
import Foundation
import CoreGraphics
struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var width: CGFloat?
    var heigth: CGFloat?
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 32, weight: .medium))
                .frame(width: width ?? size, height: heigth ?? size)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white: 1.0, opacity: 0.2)
                    }
                }
                .clipShape(Capsule())
    }
}

struct Constants {
    static let padding: CGFloat = 12.0
}
private func getButtonSize() -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let buttonCount: CGFloat = 4.0
    let spacingCount = buttonCount + 1
    return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
}

/*
struct ButtonPad: View {
    var body: some View {
        VStack{
            HStack(spacing: Constants.padding){
                Button("AC") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.lightGray),
                                foregroundColor: .black)
                            )
                Button("+/-") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.lightGray),
                                foregroundColor: .black)
                            )
                Button("%") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.lightGray),
                                foregroundColor: .black)
                            )
                Button("/") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.orange),
                                foregroundColor: .white)
                            )
            }
            HStack(spacing: Constants.padding){
                Button("7") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("8") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("9") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("X") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.orange),
                                foregroundColor: .white)
                            )
            }
            HStack(spacing: Constants.padding){
                Button("4") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("5") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("6") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("-") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.orange),
                                foregroundColor: .white)
                            )
            }
            HStack(spacing: Constants.padding){
                Button("1") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("2") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("3") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("+") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.orange),
                                foregroundColor: .white)
                            )
            }
            HStack(spacing: Constants.padding){
               
                Button("0") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize()*2,
                                width: getButtonSize()*2+Constants.padding,
                                heigth: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button(",") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: .secondary,
                                foregroundColor: .white)
                            )
                Button("=") { }
                            .buttonStyle(CalculatorButtonStyle(
                                size: getButtonSize(),
                                backgroundColor: Color(.orange),
                                foregroundColor: .white)
                            )
            }
        }
    }
    
}

*/
struct Calculator {
    
    // ButtonType
    enum ButtonType: Hashable, CustomStringConvertible {
        case digit(_ digit: Digit)
        case operation(_ operation: ArithmeticOperation)
        case negative
        case percent
        case decimal
        case equals
        case allClear
        case clear
        
        var description: String {
            switch self {
            case .digit(let digit):
                return digit.description
            case .operation(let operation):
                return operation.description
            case .negative:
                return "±"
            case .percent:
                return "%"
            case .decimal:
                return "."
            case .equals:
                return "="
            case .allClear:
                return "AC"
            case .clear:
                return "C"
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(.lightGray)
            case .operation, .equals:
                return .orange
            case .digit, .decimal:
                return .secondary
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .allClear, .clear, .negative, .percent:
                return .black
            default:
                return .white
            }
        }
    }
    // Digit
    enum Digit: Int, CaseIterable, CustomStringConvertible {
        case zero, one, two, three, four, five, six, seven, eight, nine
        
        var description: String {
            "\(rawValue)"
        }
    }
    // ArithmeticOperation
    enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
        case addition, subtraction, multiplication, division
        
        var description: String {
            switch self {
            case .addition:
                return "+"
            case .subtraction:
                return "−"
            case .multiplication:
                return "×"
            case .division:
                return "÷"
            }
        }
    }
    // Calculator
    private struct ArithmeticExpression: Equatable {
            var number: Decimal
            var operation: ArithmeticOperation
            
            func evaluate(with secondNumber: Decimal) -> Decimal {
                switch operation {
                case .addition:
                    return number + secondNumber
                case .subtraction:
                    return number - secondNumber
                case .multiplication:
                    return number * secondNumber
                case .division:
                    return number / secondNumber
                }
            }
        }
        
        // MARK: - PROPERTIES
        
        private var newNumber: Decimal? {
            didSet {
                guard newNumber != nil else { return }
                carryingNegative = false
                carryingDecimal = false
                carryingZeroCount = 0
                pressedClear = false
            }
        }
        private var expression: ArithmeticExpression?
        private var result: Decimal?
        
        private var carryingNegative: Bool = false
        private var carryingDecimal: Bool = false
        private var carryingZeroCount: Int = 0
        
        private var pressedClear: Bool = false
        
        // MARK: - COMPUTED PROPERTIES
        
        var displayText: String {
            return getNumberString(forNumber: number, withCommas: true)
        }
        
        var showAllClear: Bool {
            newNumber == nil && expression == nil && result == nil || pressedClear
        }
            
        var number: Decimal? {
            if pressedClear || carryingDecimal {
                return newNumber
            }
            return newNumber ?? expression?.number ?? result
        }
        
        private var containsDecimal: Bool {
            return getNumberString(forNumber: number).contains(".")
        }
        
        // MARK: - OPERATIONS
        
        mutating func setDigit(_ digit: Digit) {
            if containsDecimal && digit == .zero {
                carryingZeroCount += 1
            } else if canAddDigit(digit) {
                let numberString = getNumberString(forNumber: newNumber)
                newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
            }
        }
        
        mutating func setOperation(_ operation: ArithmeticOperation) {
            guard var number = newNumber ?? result else { return }
            if let existingExpression = expression {
                number = existingExpression.evaluate(with: number)
            }
            expression = ArithmeticExpression(number: number, operation: operation)
            newNumber = nil
        }
        
        mutating func toggleSign() {
            if let number = newNumber {
                newNumber = -number
                return
            }
            if let number = result {
                result = -number
                return
            }
            
            carryingNegative.toggle()
        }
        
        mutating func setPercent() {
            if let number = newNumber {
                newNumber = number / 100
                return
            }
            if let number = result {
                result = number / 100
                return
            }
        }
        
        mutating func setDecimal() {
            if containsDecimal { return }
            carryingDecimal = true
        }
        
        mutating func evaluate() {
            guard let number = newNumber, let expressionToEvaluate = expression else { return }
            result = expressionToEvaluate.evaluate(with: number)
            expression = nil
            newNumber = nil
        }
        
        mutating func allClear() {
            newNumber = nil
            expression = nil
            result = nil
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
        }
        
        mutating func clear() {
            newNumber = nil
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
            
            pressedClear = true
        }
        
        // MARK: - HELPERS
        
        func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
            return expression?.operation == operation && newNumber == nil
        }
        
        private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
            var numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
            
            if carryingNegative {
                numberString.insert("-", at: numberString.startIndex)
            }
            
            if carryingDecimal {
                numberString.insert(".", at: numberString.endIndex)
            }
            
            if carryingZeroCount > 0 {
                numberString.append(String(repeating: "0", count: carryingZeroCount))
            }
            
            return numberString
        }
        
        private func canAddDigit(_ digit: Digit) -> Bool {
            return number != nil || digit != .zero
        }
    
    // MARK: - ACTIONS
    mutating func performAction(for buttonType: ButtonType) {
               switch buttonType {
               case .digit(let digit):
                   setDigit(digit)
               case .operation(let operation):
                   setOperation(operation)
               case .negative:
                   toggleSign()
               case .percent:
                   setPercent()
               case .decimal:
                   setDecimal()
               case .equals:
                   evaluate()
               case .allClear:
                   allClear()
               case .clear:
                   clear()
               }
           }
}

struct CalculatorView: View {
    @State var _displayText: String = "0"
    @State var latestDisplayText: String = "0"
    @State var latestDisplayTextCalc: Float = 0
    @State var latestOeration: String = ""
    
    @State private var calculator = Calculator()  // Initialize calculator instance here

    /*
    func calcul (operation){
        if operation == "+"
            self.latestDisplayTextCalc = self.latestDisplayTextCalc
    }
    */
    func clickNumber (digit: String) {
        if self._displayText + digit == "0" + digit {
            self._displayText = digit
            let oparation = self.latestOeration == "X" ? "*" : self.latestOeration
            self.latestDisplayText = self.latestOeration + digit
           
            self.latestOeration = ""
        } else {
                self._displayText = self._displayText + digit
            self.latestDisplayText = self._displayText + digit
        }
    }
    
    func clickClear () {
        self._displayText = "0"
        self.latestDisplayText = "0"
    }
    
    func clickPlus() {
        //calcul()
        self.latestOeration = "+"
        self.latestDisplayText = self._displayText
        self._displayText = "0"
    }
    
    private func formattedText(key: String) -> some View {
        Text(LocalizedStringKey(key))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 30, weight: .light))
            .font(.system(size: 80))
            .lineLimit(1)
            //.minimumScaleFactor(0.3)
    }
    
    
    
    
    private func textLine(_ key: String) -> some View {
        formattedText(key: key)
            .hidden()
            .overlay(
                ViewThatFits(in: .horizontal) {
                    formattedText(key: key)
                    ScrollView(.horizontal) {
                        formattedText(key: key)
                    }
                }
            )
    }
    var body: some View {
        VStack{
            Spacer()
            // textLine(latestDisplayText)
            Text(calculator.displayText)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 77, weight: .light))
                .lineLimit(2)
                //.minimumScaleFactor(0.3)
            // ButtonPad()
            VStack{
                HStack(spacing: Constants.padding){
                    Button("AC") {
                        clickClear()
                        calculator.performAction(for: .allClear)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.lightGray),
                                    foregroundColor: .black)
                                )
                    Button("+/-") {
                        calculator.performAction(for: .negative)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.lightGray),
                                    foregroundColor: .black)
                                )
                    Button("%") {
                        calculator.performAction(for: .percent)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.lightGray),
                                    foregroundColor: .black)
                                )
                    Button("÷") {
                        calculator.performAction(for: .operation(.division))
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.orange),
                                    foregroundColor: .white)
                                )
                }
                HStack(spacing: Constants.padding){
                    Button("7") {
                        self.clickNumber(digit: "7")
                        calculator.setDigit(.seven)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("8") { self.clickNumber(digit: "8")
                        calculator.setDigit(.eight)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("9") {  self.clickNumber(digit: "9")
                        calculator.setDigit(.nine)
                   }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("×") {
                        calculator.performAction(for: .operation(.multiplication))
                     }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.orange),
                                    foregroundColor: .white)
                                )
                }
                HStack(spacing: Constants.padding){
                    Button("4") {  self.clickNumber(digit: "4")
                        calculator.setDigit(.four)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("5") { self.clickNumber(digit: "5")
                        calculator.setDigit(.five)
                   }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("6") { self.clickNumber(digit: "6")
                        calculator.setDigit(.six)
                   }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("-") {
                        calculator.performAction(for: .operation(.subtraction))
                      }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.orange),
                                    foregroundColor: .white)
                                )
                }
                HStack(spacing: Constants.padding){
                    Button("1") { self.clickNumber(digit: "1")
                        calculator.setDigit(.one)
                   }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("2") { self.clickNumber(digit: "2")
                        calculator.setDigit(.two)
                   }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("3") { self.clickNumber(digit: "3")
                        calculator.setDigit(.three)
                   }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("+") { self.clickPlus()
                        calculator.performAction(for: .operation(.addition))
                     }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.orange),
                                    foregroundColor: .white)
                                )
                }
                HStack(spacing: Constants.padding){
                   
                    Button("0") {
                        self.clickNumber(digit: "0")
                        calculator.setDigit(.zero)
                      }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize()*2,
                                    width: getButtonSize()*2+Constants.padding,
                                    heigth: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button(".") {
                        calculator.performAction(for: .decimal)
                     }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("=") {
                        calculator.performAction(for: .equals)
                    }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: Color(.orange),
                                    foregroundColor: .white)
                                )
                }
            }
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}

#Preview {
    CalculatorView()
}
