//
//  Exercise.swift
//  
//
//  Created by Mark Shackelford on 6/16/16.
//
//

import Foundation


enum ExerciseType {
	case Defined
	case Open
}


class ExerciseContext {
	var identifier: CFUUID
	var type: ExerciseType
	var name: String
	var exerciseDescription: String?
	var picture1URL: URL?
	var picture2URL: URL?
	var videoURL: URL?
	var length = 0.0	//reps or duration
	var rest: UInt = 0		//seconds
	var count: UInt = 1
	
	init(name: String, type: ExerciseType) {
		self.identifier = CFUUIDCreate(kCFAllocatorDefault)
		self.name = name
		self.type = type
	}
	
	func createExercise(value: Double) -> Exercise {
		assert(type == .Defined)
		assert(value > 0.0)
		assert(length >  0.0)
		
		let exercise = Exercise(context:self);
		exercise.addInterval(value:value, length:self.length, rest:self.rest, count:self.count)
		return exercise
	}

	func createExercise(value: Double, length: Double, rest: UInt, count: UInt) -> Exercise {
		assert(type == .Open)
		assert(value > 0.0)
		assert(length >  0.0)

		let exercise = Exercise(context:self);
		exercise.addInterval(value:value, length:length, rest:rest, count:count)
		return exercise
	}
}


class Exercise {
	var identifier: CFUUID
	var context: ExerciseContext
	var lastCompletedDate: Date?
	
	class Interval: NSObject, NSCoding {
		var value = 0.0		//weight (lbs) or speed (mph) depending on exercise type
		var length = 0.0	//reps or duration
		var rest: UInt = 0		//seconds
		var count: UInt = 1
		
		init(value: Double, length: Double, rest: UInt, count: UInt) {
			self.value = value
			self.length = length
			self.rest = rest
			self.count = count
		}
		
		required init?(coder aDecoder: NSCoder) {
			//TODO: impl
		}
		
		func encode(with aCoder: NSCoder) {
			//TODO: impl
		}
	}
	
	var intervals: [Interval]

	required init(context: ExerciseContext) {
		identifier = CFUUIDCreate(kCFAllocatorDefault)
		self.context = context
		intervals = []
	}
	
	func addInterval(value: Double) {
		let interval = Interval(value:value, length:self.context.length, rest:self.context.rest, count:self.context.count);
		intervals.append(interval)
	}

	func addInterval(value: Double, length: Double, rest: UInt, count: UInt) {
		let interval = Interval(value:value, length:length, rest:rest, count:count);
		intervals.append(interval)
	}
	
	func encodeIntervals() -> NSData {
		let data = NSMutableData()
		let coder = NSKeyedArchiver(forWritingWith: data)
		for interval in intervals {
			interval.encode(with:coder)
		}
		coder.finishEncoding()
		return data
	}
	
	func decodeIntervals(data: NSData, count: UInt) {
		//TODO: impl
	}
}

func setup ()
{
	let barbellPress = ExerciseContext(name:"Barbell Press", type: .Defined)
	barbellPress.exerciseDescription = "This is a description"
	barbellPress.length = 10 //reps
	barbellPress.rest = 60 //seconds
	barbellPress.count = 10 //sets
	barbellPress.picture1URL = URL(fileURLWithPath: "path to pic1")
	barbellPress.picture2URL = URL(fileURLWithPath: "path to pic2")
	barbellPress.videoURL = URL(fileURLWithPath: "path to video")
}

func someFunction()
{
	let controller = WorkoutEditorController()
	controller.workoutIdentifier = identifier
	[controller.window showModal:^(NSResult result){
	}]
	
}

func addExercise(ofType context: ExerciseContext, toWorkout identifier: CFUUID)
{
	let controller = ExerciseEditorController()
	controller.context = description
	[controller.window showModal:^(NSResult result){
		if (description.type == .Defined) {
			description.createExercise(value:controller.value)
		}
		else {
			description.createExercise(value:controller.value, length:controller.length, rest:controller.rest, conut:controller.count)
		}
	}]
}
