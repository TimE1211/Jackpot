//
//  Ticket.swift
//  Jackpot
//
//  Created by Timothy Hang on 3/28/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

class Ticket
{
  var picks = Set<Int>()
  
//  var number1: String
//  var number2: String
//  var number3: String
//  var number4: String
//  var number5: String
//  var number6: String
//  
  init()
  {
    for _ in 0..<6
    {
      createPick()
    }
  }
  
//  init (number1: String, number2: String, number3: String, number4: String, number5: String, number6: String)
//  {
//    self.number1 = number1
//    self.number2 = number2
//    self.number3 = number3
//    self.number4 = number4
//    self.number5 = number5
//    self.number6 = number6
//  }
  
  func createPick()
  {
    var pickFound = false
    repeat
    {
      let aPick = Int(arc4random() % 53 + 1)                    // make numbers up to 53 be generated
      if !picks.contains(aPick)
      {
        picks.insert(aPick)                                     //not append since there is no order or indexes
        pickFound = true
      }
    } while !pickFound
  }
  
  func description() -> String
  {
    var numbers = ""
    for pick in picks.sorted()
    {
      numbers += " \(pick)"
    }
    return numbers
  }
  
//  func winningTicketDescription() -> String
//  {
//    return "\(number1) \(number2) \(number3) \(number4) \(number5) \(number6)"
//  }
}
