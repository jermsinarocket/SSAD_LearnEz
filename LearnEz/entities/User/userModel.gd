extends Node

var baseUrl = "user"
var userID
var userEmail
var userPassword
var userRole
var userAvatarID
var userAvatar

func getBaseUrl():
	return baseUrl
	
func setUserID(userID):
	self.userID = userID 

func setUserEmail(userEmail):
	self.userEmail = userEmail 
	
func setUserPassword(userPassword):
	self.userPassword = userPassword

func setUserAvatar(userAvatar):
	self.userAvatar = userAvatar

func setUserAvatarID(userAvatarID):
	self.userAvatarID = userAvatarID

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
	
func getUserAvatar():
	return userAvatar

func getUserAvatarID():
	return userAvatarID