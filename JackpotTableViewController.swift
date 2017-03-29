//
//  JackpotTableViewController.swift
//  Jackpot
//
//  Created by Timothy Hang on 3/28/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//
//https://iswift.org/cookbook/generate-a-random-number          random number generator

import UIKit

class JackpotTableViewController: UITableViewController
{
  var lotteryArray = [Ticket]()
  var Number1 = String(arc4random_uniform(52)) //: String
  var Number2 = String(arc4random_uniform(52))
  var Number3 = String(arc4random_uniform(52))
  var Number4 = String(arc4random_uniform(52))
  var Number5 = String(arc4random_uniform(52))
  var Number6 = String(arc4random_uniform(52))
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int
  {
      // #warning Incomplete implementation, return the number of sections
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
      // #warning Incomplete implementation, return the number of rows
    return lotteryArray.count
  }
//  
//  func winningNumbersEntered()
//  {
//    let winningTicket = Ticket(number1: randomNum1, number2: randomNum2, number3: randomNum3, number4: randomNum4, number5: randomNum5, number6: randomNum6)
//    lotteryArray.append(aTicket)
//  }
//  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ticket", for: indexPath)
    let ticket = lotteryArray[indexPath.row]
    cell.textLabel?.text = ticket.description()
    return cell
  }
  
  @IBAction func plusTapped(sender: UIBarButtonItem)
  {
    Ticket.createPick()
    
  }

  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }
  */

  /*
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }    
  }
  */

  /*
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
  }
  */

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
