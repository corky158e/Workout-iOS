//
//  Person.swift
//  
//
//  Created by Mark Shackelford on 6/16/16.
//
//

import Foundation


class Person {
	let identifier = CFUUIDCreate(kCFAllocatorDefault)
	var name: String
	var lastWorkout: String?
	var workouts: [String]?
	
	init(name: String) {
		self.name = name
	}
	
	func start(workout: Workout, session: WorkoutSession, exercise: Exercise) {
		workout.start(session:session, exercise:exercise)
	}
	
	func endCurrentWorkout() {
	}
}
