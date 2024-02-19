extends Node2D

var playerScore = 0;
var computerScore = 0;

var computerFigure = 0;
var playerFigure = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerScore.text = "Gracz: " + str(playerScore);
	$ComputerScore.text = "Komputer: " + str(computerScore);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_choosed(figure):
	playerFigure = figure;

func _on_computer_choosed_figure(figure):
	computerFigure = figure;
	score_update(); #W momencie dostania sygnału, ze komputer wybrał swoją figurę, wiadomym jest, że gracz już też wybrał (funkcja wybierania przez komputer startuje gdy gracz wybierze)
					#Zatem można rozpocząć sprawdzanie punktów

func score_update(): #papier - 1, kamien - 2, nozyce - 3. papier bije kamien (1-2), kamien bije nozyce (2-3), nozyce biją papier (3-1)
	match (computerFigure+playerFigure)%5 :
		0: 
			if(playerFigure<computerFigure) : playerScore+=1;
			elif(playerFigure>computerFigure) : computerScore+=1;
		3:
			if(playerFigure<computerFigure) : playerScore+=1;
			elif(playerFigure>computerFigure) : computerScore+=1;
		4:
			if(playerFigure>computerFigure) : playerScore+=1;
			elif(playerFigure<computerFigure) : computerScore+=1;
			
	$PlayerScore.text = "Player: " + str(playerScore);
	$ComputerScore.text = "Computer: " + str(computerScore);
