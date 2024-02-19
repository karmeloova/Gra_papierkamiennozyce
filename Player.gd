extends Node2D
var papier = load("res://Images/Papier.png");
var kamien = load("res://Images/Kamien.png");
var nozyce = load("res://Images/Nozyce.png");
signal choosed(figure); #Sygnał mówiący o tym, że gracz wybrał 

# Called when the node enters the scene tree for the first time.
func _ready():
	$ChooseFigure.add_item("Wybierz", 0)
	$ChooseFigure.add_item("Papier", 1);
	$ChooseFigure.add_item("Kamień", 2);
	$ChooseFigure.add_item("Nożyce", 3);
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_choose_figure_item_selected(index): #w momencie zmiany opcji na przycisku, wysyła on sygnał, który mówi, że trzeba zmienić obraz i zacząć losowanie
	if(index>0) :
		match index:
			1: $ChoosedFigure.set_texture(papier);
			2: $ChoosedFigure.set_texture(kamien);
			3: $ChoosedFigure.set_texture(nozyce);
		emit_signal("choosed"); #Sygnał emitowany za każdym razem, gdy gracz wybierze swoją figurę
		emit_signal("choosed", index);
		$ChooseFigure.select(0);
