extends Node

var baseUrl = "user"
var userID
var userEmail
var userPassword
var userRole

func getBaseUrl():
	return baseUrl
	
func setUserID(userID):
	self.userID = userID 

func setEmail(userEmail):
	self.userEmail = userEmail 
	
func setPassword(userPassword):
	self.userPassword = userPassword

func setUserRole(userRole):
	self.userRole = userRole

func getUserRole():
	return userRole

func getUserId():
	return userID
	
func getUserPassword():
	return userPassword

func getUserEmail():
	return userEmail