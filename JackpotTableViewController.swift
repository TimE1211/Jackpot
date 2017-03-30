//
//  JackpotTableViewController.swift
//  Jackpot
//
//  Created by Timothy Hang on 3/28/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//
//https://iswift.org/cookbook/generate-a-random-number          random number generator

import UIKit

class JackpotTableViewController: UITableViewController, WinningTicketViewControllerDelegate
{
  var lotteryArray = [Ticket]()
  var count = 0
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int
  {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return lotteryArray.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ticket", for: indexPath)
    let ticket = lotteryArray[indexPath.row]
    let ticketNumber = String(Int(indexPath.row) + 1)
    cell.textLabel?.text = "Ticket" + "\(ticketNumber): " + ticket.description()
    return cell
  }
  
  @IBAction func plusTapped(sender: UIBarButtonItem)
  {
    let aTicket = Ticket.init()
    lotteryArray.append(aTicket)
    tableView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
//    let selectedIndexPath = tableView.indexPath(for: sender as! UIBarButtonItem)!
//    let selectedAgent = agents[selectedIndexPath.row]
//    let winningTicketViewController = segue.destination as! WinningTicketViewController
//    winningTicketViewController = sender as! UIBarButtonItem
  }
  
  func winningTicketViewController(vc: WinningTicketViewController, winningTicketWasChosen ticket: Ticket)
  {
    //going to get info from WinningTicketVC and compare with random tickets and count += 1 for each number thay have shared then calculate the prizes at the end, then make the backrounds of cells light up for each winner -> 3 or more sim 
  }
}














