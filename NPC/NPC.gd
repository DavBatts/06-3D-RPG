extends KinematicBody

onready var Dialog = get_node("/root/Game/UI/Dialog")

var dialog = [
"Welcome to the game! (press E to continue)"
,"Your life depends on your speed and your accuracy"
,"Shoot the target!"
,"The challenge will start as soon as you press E."

]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialog.connect("finished_dialog", self, "finished")
	


func _on_Area_body_entered(body):
	Dialog.start_dialog(dialog)


func _on_Area_body_exited(body):
	Dialog.hide_dialog()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer).start()")
