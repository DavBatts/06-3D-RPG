extends Control

var dialog = []
var dialog_pos = 0

signal finished_dialog

func _ready():
	hide()
	
func _physics_process(_delta):
	if dialog.size() and dialog_pos < dialog.size():
		var d = "[center]" + dialog[dialog_pos] + "[/center]"
		if $Text.bbcode_text != d:
			$Text.bbcode_text = d
		if Input.is_action_just_pressed("action"):
			dialog_pos += 1
		elif dialog.size():
			emit_signal("finished_dialog")
			hide_dialog()
	
func start_dialog(d):
	dialog = d.duplicate()
	dialog_pos = 0
	show()
	
func hide_dialog():
	dialog = []
	dialog_pos = 0
	hide()
