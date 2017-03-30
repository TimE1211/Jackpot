//
//  WinningTicketViewController.swift
//  Jackpot
//
//  Created by Timothy Hang on 3/29/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

protocol WinningTicketViewControllerDelegate
{
  func winningTicketViewController(vc:WinningTicketViewController, winningTicketWasChosen: Ticket)
}                       //the view it comes from               the Ticket object I want to compare that is being sent to the delegate

class WinningTicketViewController: UIViewController, UITextFieldDelegate
{
  
  @IBOutlet weak var firstNumberTextField: UITextField!
  @IBOutlet weak var secondNumberTextField: UITextField!
  @IBOutlet weak var thirdNumberTextField: UITextField!
  @IBOutlet weak var fourthNumberTextField: UITextField!
  @IBOutlet weak var fifthNumberTextField: UITextField!
  @IBOutlet weak var sixthNumberTextField: UITextField!
  
//  var winningTicket = [String]()                        this isnt an array of winning tickets its of winning ticket numbers
  var winningTicketNumbers = [String]()
  var delegate: WinningTicketViewControllerDelegate!
  
  override func viewDidLoad()
  {
      super.viewDidLoad()
  }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool
  {
    if textField.text != ""
    {
      if let possibleNumber = textField.text
      {
        if possibleNumber.characters.count < 3
        {
          if let lotteryNumber = Int(possibleNumber)
          {
            if lotteryNumber > 0 && lotteryNumber < 54
            {
              switch textField
              {
                case firstNumberTextField:
                  secondNumberTextField.becomeFirstResponder()
                 winningTicketNumbers.append(firstNumberTextField.text!)
                case secondNumberTextField:
                  if secondNumberTextField.text != firstNumberTextField.text
                  {
                    thirdNumberTextField.becomeFirstResponder()
                    winningTicketNumbers.append(secondNumberTextField.text!)
                  }
                case thirdNumberTextField:
                  if thirdNumberTextField.text != firstNumberTextField.text && thirdNumberTextField.text != secondNumberTextField.text
                  {
                    fourthNumberTextField.becomeFirstResponder()
                    winningTicketNumbers.append(thirdNumberTextField.text!)
                  }
                case fourthNumberTextField:
                  if fourthNumberTextField.text != firstNumberTextField.text && fourthNumberTextField.text != secondNumberTextField.text && fourthNumberTextField.text != thirdNumberTextField.text
                  {
                    fifthNumberTextField.becomeFirstResponder()
                    winningTicketNumbers.append(fourthNumberTextField.text!)
                  }
                case fifthNumberTextField:
                  if fifthNumberTextField.text != firstNumberTextField.text && fifthNumberTextField.text != secondNumberTextField.text && fifthNumberTextField.text != thirdNumberTextField.text && fifthNumberTextField.text != fourthNumberTextField.text
                  {
                    sixthNumberTextField.becomeFirstResponder()
                    winningTicketNumbers.append(fifthNumberTextField.text!)
                  }
                case sixthNumberTextField:
                  if sixthNumberTextField.text != firstNumberTextField.text && sixthNumberTextField.text != secondNumberTextField.text && sixthNumberTextField.text != thirdNumberTextField.text && sixthNumberTextField.text != fourthNumberTextField.text && sixthNumberTextField.text != fifthNumberTextField.text
                  {
                    sixthNumberTextField.resignFirstResponder()
                    winningTicketNumbers.append(sixthNumberTextField.text!)
                  }
                default:
                  break
              }
            }
          }
        }
      }
    }
    return false
  }
  
//  func winningTicketChosen() -> [String]
//  {
//    let correctTicket = winningTicketNumbers.sorted()
//    return correctTicket
  
//  }  I didnt want my winning ticket to be a string since it would be very hard to campare an array of strings with a Ticket object
  
  @IBAction func compareToTickets(sender: UIButton)
  {
    var numbersSet = Set<Int>()           //making an array to store strings as ints into a set into a Ticket object
    for string in winningTicketNumbers
    {
      if let number = Int(string)       //using if let instead of optional since some string's cant be turned into Int's
      {
        numbersSet.insert(Int(number))
      }
    }
    let winningTicket = Ticket(picks: numbersSet)
    delegate.winningTicketViewController(vc: self, winningTicketWasChosen: winningTicket)
  }
}










