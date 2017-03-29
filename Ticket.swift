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
  
  init()
  {
    for _ in 0..<6
    {
      createPick()
    }
  }
  
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
}
