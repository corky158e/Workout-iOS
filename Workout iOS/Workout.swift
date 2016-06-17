//
//  Workout.swift
//  
//
//  Created by Mark Shackelford on 6/16/16.
//
//

import Foundation


class Workout {
	let identifier: CFUUID
	let name: String
	let workoutDescription: String
	let exercises: [String] //array of exercise identifiers
	var currentExerciseIndex = 0
	
	
	func nextExercise() -> Exercise {
		currentExerciseIndex++
		if (currentExerciseIndex > exercises.count-1) {
			for exercise in exercises {
				if exercise.completed == false {
					break;
				}
			}
		}
		else {
			execise = exercises[currentExerciseIndex]
		}
		return exercise
	}
	
	func exerciseAtIndex(index: Int) -> Exercise {
	}
}
