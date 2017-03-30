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
}

class WinningTicketViewController: UIViewController, UITextFieldDelegate
{
  
  @IBOutlet weak var firstNumberTextField: UITextField!
  @IBOutlet weak var secondNumberTextField: UITextField!
  @IBOutlet weak var thirdNumberTextField: UITextField!
  @IBOutlet weak var fourthNumberTextField: UITextField!
  @IBOutlet weak var fifthNumberTextField: UITextField!
  @IBOutlet weak var sixthNumberTextField: UITextField!
  
  var winningTicket = [String]()
  var winningTicketNumbers = [String]()
  var delegate: WinningTicketViewControllerDelegate!
  
  override func viewDidLoad()
  {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
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
                 winningTicket.append(firstNumberTextField.text!)
                case secondNumberTextField:
                  if secondNumberTextField.text != firstNumberTextField.text
                  {
                    thirdNumberTextField.becomeFirstResponder()
                    winningTicket.append(secondNumberTextField.text!)
                  }
                case thirdNumberTextField:
                  if thirdNumberTextField.text != firstNumberTextField.text && thirdNumberTextField.text != secondNumberTextField.text
                  {
                    fourthNumberTextField.becomeFirstResponder()
                    winningTicket.append(thirdNumberTextField.text!)
                  }
                case fourthNumberTextField:
                  if fourthNumberTextField.text != firstNumberTextField.text && fourthNumberTextField.text != secondNumberTextField.text && fourthNumberTextField.text != thirdNumberTextField.text
                  {
                    fifthNumberTextField.becomeFirstResponder()
                    winningTicket.append(fourthNumberTextField.text!)
                  }
                case fifthNumberTextField:
                  if fifthNumberTextField.text != firstNumberTextField.text && fifthNumberTextField.text != secondNumberTextField.text && fifthNumberTextField.text != thirdNumberTextField.text && fifthNumberTextField.text != fourthNumberTextField.text
                  {
                    sixthNumberTextField.becomeFirstResponder()
                    winningTicket.append(fifthNumberTextField.text!)
                  }
                case sixthNumberTextField:
                  if sixthNumberTextField.text != firstNumberTextField.text && sixthNumberTextField.text != secondNumberTextField.text && sixthNumberTextField.text != thirdNumberTextField.text && sixthNumberTextField.text != fourthNumberTextField.text && sixthNumberTextField.text != fifthNumberTextField.text
                  {
                    sixthNumberTextField.resignFirstResponder()
                    winningTicket.append(sixthNumberTextField.text!)
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
  func winningTicketChosen() -> [String]
  {
    let correctTicket = winningTicketNumbers.sorted()
    return correctTicket
  }
  
  @IBAction func compareToTickets(sender: UIButton)
  {
    var numbersSet = Set<Int>()           //making an array to store strings as ints into a set into a Ticket object
    for string in winningTicketNumbers
    {
      if let number = Int(string)
      {
        numbersSet.insert(Int(number))
      }
    }
    let winningTicket = Ticket(picks: numbersSet)
    delegate.winningTicketViewController(vc: self, winningTicketWasChosen: winningTicket)
}










