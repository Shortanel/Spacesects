extends Node

var star_type ={
	"big":50,
	"small":60
}

var World = null
var Player = null
var Sound_controller = null

var big_layer 
var small_layer 

var pause = false
var hit = false
var player_can_shoot = true
var fly_can_shoot = true

var score = 0

var Explosion = preload("res://Scene/VFX/Explosion.tscn")
var Laser = preload("res://Scene/VFX/Laser.tscn")
var Fly_projectile = preload("res://Scene/VFX/Fly_projectile.tscn")

const screen_width = 320
const screen_height = 180
