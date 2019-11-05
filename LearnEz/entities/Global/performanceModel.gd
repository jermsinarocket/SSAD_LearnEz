extends Node

#Performance
var studentsList
var selectedStudentIdx

func setStudentsList(stuList):
	self.studentsList = stuList
	
func getStudentsList():
	return self.studentsList
	
func getStudentNameByIdx(idx):
	return (studentsList[idx])['name']

func getStudentMatricByIdx(idx):
	return (studentsList[idx])['userID']