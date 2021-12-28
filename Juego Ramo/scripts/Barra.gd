extends TextureProgress

func _ready():
	vida.health_bar = self
	value = vida.life

func update_health():
	value = vida.life
