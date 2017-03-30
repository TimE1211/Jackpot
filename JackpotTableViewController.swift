//
//  JackpotTableViewController.swift
//  Jackpot
//
//  Created by Timothy Hang on 3/28/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//
//https://iswift.org/cookbook/generate-a-random-number          random number generator

import UIKit

class JackpotTableViewController: UITableViewController //, WinningTicketDelegate
{
  var lotteryArray = [Ticket]()
  
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


}














