//
//  StudentController.swift
//  Students
//
//  Created by Percy Ngan on 12/12/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import Foundation

class StudentController {

	private var persistentFileURL: URL? {
		guard let filePath = Bundle.main.path(forResource: "students", ofType: "json") else {
			return nil }
		return URL(fileURLWithPath: filePath)
		}

	// @escaping means that it is possible for the clousre that follows to be called after the scope of the func that contains the closure
	func loadFromPersistentStore(completion: @escaping ([Student]?, Error?) -> Void) {
		let bgQueue = DispatchQueue(label: "studentQueue", attributes: .concurrent)

		bgQueue.async {
			let fm = FileManager.default
			guard let url = self.persistentFileURL,
				fm.fileExists(atPath: url.path) else { return }

			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				let students = try decoder.decode([Student].self, from: data) // We are decoding from data and should get back an array of Student objects
				completion(students, nil) // If we get pass lines 29, 30, and 31 that means that we are geting our data and decoding it, so we call completion and pass in the parameter students because we successfully got back a student value and also parameter of nil for the error because if we succeeded then there is no error.
			} catch {
				NSLog("Error loading student data: \(error)")
				completion(nil, error) // Conversely, if we don't get back anything for line 29, 30, and 31 then we also call completion but for this instance the parameter for the student value is nil and we do get an error.
			}
		}
	}
	}

