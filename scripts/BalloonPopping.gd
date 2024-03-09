extends Node2D

var total_money : float = 0
var current_val : float = 0
var increment : float = 0.5
var chance_to_pop : float = .2
var count = 0
var ballons_left = 25
@onready var base_scale = $Balloon.scale.x

@onready var lb_currval = $lb_currentvalue
@onready var lb_totval = $lb_totalvalue
@onready var lb_balloonsleft = $lb_balloonsleft
@onready var pop_timer = $PopTimer
@onready var track = $LaughTrack

func _ready():
	var winsize = get_viewport_rect().size
	lb_currval.position = Vector2(winsize.x / 6, winsize.y / 10)
	lb_totval.position = Vector2(3 * winsize.x / 5, winsize.y / 10)
	lb_balloonsleft.position = Vector2(3 * winsize.x / 8, winsize.y / 20)
	$Balloon.position = Vector2(winsize.x/2, winsize.y/2)

func _process(delta):

	#if pop_timer.is_stopped():
		#if Input.is_action_just_pressed("increase"):
			#increase()
#
		#if Input.is_action_just_pressed("submit"):	
			#submit()
	
	lb_currval.text = "Current Value: $" + str(current_val)
	lb_totval.text = "Total value: $" + str(total_money)
	lb_balloonsleft.text = str(ballons_left) + " balloon(s) left!"

func reset_balloon():
	count = 0
	$Balloon.texture = load("res://assets/balloon/tile000.png")
	$Balloon.scale.x = base_scale
	ballons_left -= 1

func fail():
	current_val = 0
	track.play_random_sound()
	pop_timer.start()
	$Balloon.texture = load("res://assets/balloon/tile007.png")
	
	pass

func succeed_increase():
	current_val += increment
	if count < 6:
		count += 1
	if count >= 6:
		$Balloon.scale.x *= 1.1
	$Balloon.texture = load("res://assets/balloon/tile00" + str(count) + ".png")
	
	pass

func submit():
	if pop_timer.is_stopped() and count > 0:
		total_money += current_val
		current_val = 0
		
		reset_balloon()
		pass

func _on_pop_timer_timeout():
	reset_balloon()

func increase():
	if pop_timer.is_stopped():
		if randf() < chance_to_pop:
			fail()
		else:
			succeed_increase()


func _on_bank_button_button_down():
	$BankButton.icon = load("res://assets/balloon/bank1.png")
	pass # Replace with function body.

func _on_bank_button_button_up():
	$BankButton.icon = load("res://assets/balloon/bank0.png")
	submit()
	pass # Replace with function body.

func _on_pump_button_button_down():
	$PumpButton.icon = load("res://assets/balloon/pump1.png")
	pass # Replace with function body

func _on_pump_button_button_up():
	$PumpButton.icon = load("res://assets/balloon/pump0.png")
	increase()
	pass # Replace with function body.

func _on_pump_button_pressed():
	#increase()
	pass # Replace with function body.

func _on_bank_button_pressed():
	#submit()
	pass # Replace with function body.
