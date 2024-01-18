import UIKit
import Foundation

/*
 * Cameron Crockett - Mobile Development
 * Introduced a boolean parameter to determine which calculation to perform.
 */
func Payment(amount: Int, payment: Int, interest: Float, isYearly: Bool) -> Float {
    let interestRate = isYearly ? interest / 100 : interest / 12 / 100
    let numerator = Float(amount) * interestRate
    let denominator = 1 - pow(1 + interestRate, -Float(payment))
    
    let calculatedPayment = numerator / denominator
    return calculatedPayment
}

let monthlyPayment = Payment(amount: 20000, payment: 2, interest: 4.4, isYearly: false)
let yearlyPayment = Payment(amount: 150000, payment: 30, interest: 5, isYearly: true)
print("2-month loan of $20,000 @ 4.4% APR, compounded monthly. Monthly payment: $\(monthlyPayment)")
print("30-year loan of $150,000 @ 5% APR, with one annual payment each year for 30 years. Yearly payment: $\(yearlyPayment)")
