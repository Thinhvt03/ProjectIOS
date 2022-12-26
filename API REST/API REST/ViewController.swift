//
//  ViewController.swift
//  API REST
//
//  Created by Hoàng Loan on 26/12/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
        
        var stories: [Story] = []

            override func viewDidLoad() {
                super.viewDidLoad()
                tableView.dataSource = self
                
                Story.fetchStories({ (stories: [Story]) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        self.stories = stories
                        self.tableView.reloadData()
                    })
                }, error: nil)
                
                let refreshControl = UIRefreshControl()
                refreshControl.addTarget(self, action: #selector(refreshControlAction), for: UIControl.Event.valueChanged)
                    tableView.insertSubview(refreshControl, at: 0)
            }
    
   // create tableView the list
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
                cell.story = stories[indexPath.row]
                return cell
            }

            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return stories.count
            }
    // acttion update the list
   @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {

          let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
          let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in

              tableView.reloadData()

              refreshControl.endRefreshing()
          }
          task.resume()
      }
    
    }
       

