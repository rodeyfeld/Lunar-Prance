extends CharacterBody2D

class_name Actor

const SPEED = 0
const JUMP_VELOCITY = -20.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


