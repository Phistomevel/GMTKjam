extends HSlider

# busName muss im Inspektor des AudioSlider eingegeben werden
@export
var busName: String

var busIndex: int

func _ready():
	# Setze busIndex
	busIndex = AudioServer.get_bus_index(busName)
	
	# Setze Schieberegler auf die Lautstärke der aktuellen Lautstärke
	value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))
	
	# Ändere die Lautstärke, nachdem der Schieberegler bewegt wurde
	value_changed.connect(_on_value_changed)

# Funktion, die Lautstärke aktualisiert
func _on_value_changed(value: float):
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))
