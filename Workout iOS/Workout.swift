//
//  Workout.swift
//  
//
//  Created by Mark Shackelford on 6/16/16.
//
//

import Foundation


class WorkoutSession {
	var exercises = [Exercise]()
	var currentExerciseIndex = 0
	
	func addExercise(exercise: Exercise) {
		exercises.append(exercise)
	}
	
	func nextExercise() -> Exercise {
		var nextExercise: Exercise
		
		currentExerciseIndex += 1
		if (currentExerciseIndex > exercises.count-1) {
			for exercise in exercises {
				if exercise.completed == false {
					break;
				}
			}
		}
		else {
			nextExercise = exercises[currentExerciseIndex]
		}
		return nextExercise
	}
	
	func start(exercise:exercise) {
	}
	
	func endCurrentExercise() {
	}
}


class Workout {
	let uuid = CFUUIDCreate(kCFAllocatorDefault)
	let name: String
	let shortDescription: String
	let longDescription: String
	let sessions = [WorkoutSession]()
	var currentSessionIndex = 0
	var lastCompletedDate: Date?
	var lastSessionDate: Date?

	init(name: String) {
		self.name = name
	}
	
	func identifier() -> String {
		return CFUUIDCreateString(kCFAllocatorDefault, uuid) as String
	}
	
	func nextSession(persion: Person) -> WorkoutSession {
		let session = sessions[currentSessionIndex]
		currentSessionIndex += 1
		return session
	}
	
	func start(session: WorkoutSession, exercise: Exercise) {
		session.start(exercise:exercise)
	}
	
	func endCurrentSession() {
	}
}
