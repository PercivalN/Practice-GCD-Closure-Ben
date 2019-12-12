//
//  StudentsViewController.swift
//  Students
//
//  Created by Percy Ngan on 12/11/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {

	@IBOutlet weak var sortSelector: UISegmentedControl!
	@IBOutlet weak var filterSelector: UISegmentedControl!
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
	}

	// MARK: Action Handlers
	@IBAction func sort(_ sender: UISegmentedControl) {
	}
	@IBAction func filter(_ sender: UISegmentedControl) {
	}



}

extension StudentsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

		return cell
	}

}

