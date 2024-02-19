extends Node2D
var papier = load("res://Images/Papier.png");
var kamien = load("res://Images/Kamien.png");
var nozyce = load("res://Images/Nozyce.png");
signal choosedFigure(figure);
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$DrawAnimation.play();
	pass

func _on_player_choosed(): #Sygnał emitowany przez gracza w momencie, gdy wybierze swoją figurę
	$Figure.visible = false;
	$DrawAnimation.visible = true;
	$DrawAnimation.play();
	$TimerWait.start(2);

func _on_timer_wait_timeout():
	$DrawAnimation.stop();
	$DrawAnimation.visible = false;
	$Figure.visible = true;
	var randomFigure = randi_range(1,3); #Losowanie, którą figurę ma zagrać komputer
	match randomFigure :
		1: $Figure.set_texture(papier);
		2: $Figure.set_texture(kamien);
		3: $Figure.set_texture(nozyce);
	emit_signal("choosedFigure", randomFigure);
