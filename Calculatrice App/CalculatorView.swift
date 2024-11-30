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
struct Calculator {
    var number: Decimal
    
    var displayText: String {
           return getNumberString(forNumber: number, withCommas: true)
       }
    
    
    
    
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        let numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
           /*
           if carryingNegative {
               numberString.insert("-", at: numberString.startIndex)
           }
           
           if carryingDecimal {
               numberString.insert(".", at: numberString.endIndex)
           }
           
           if carryingZeroCount > 0 {
               numberString.append(String(repeating: "0", count: carryingZeroCount))
           }
            */
           
           return numberString
       }
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

struct CalculatorView: View {
    @State var displayText: String = "0"
    
    func clickNumber (digit: String) {
        if self.displayText + digit == "0" + digit {
                self.displayText = digit
        } else {
                self.displayText = self.displayText + digit
        }
    }
    
    func clickClear () {
        self.displayText = "0"
    }
    var body: some View {
        VStack{
            Spacer()
            Text(displayText)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 77, weight: .light))
                .lineLimit(2)
            // ButtonPad()
            VStack{
                HStack(spacing: Constants.padding){
                    Button("AC") { clickClear() }
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
                    Button("7") { self.clickNumber(digit: "7") }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("8") { self.clickNumber(digit: "8") }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("9") {  self.clickNumber(digit: "9") }
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
                    Button("4") {  self.clickNumber(digit: "4") }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("5") { self.clickNumber(digit: "5") }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("6") { self.clickNumber(digit: "6") }
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
                    Button("1") { self.clickNumber(digit: "1") }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("2") { self.clickNumber(digit: "2") }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: getButtonSize(),
                                    backgroundColor: .secondary,
                                    foregroundColor: .white)
                                )
                    Button("3") { self.clickNumber(digit: "3") }
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
                   
                    Button("0") { self.clickNumber(digit: "0") }
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
        .padding(Constants.padding)
        .background(Color.black)
    }
}

#Preview {
    CalculatorView()
}
