extends Control

func _ready():
	PlayerStats.money_changed.connect(update_money)
	PlayerStats.energy_changed.connect(update_energy)

	update_money(PlayerStats.money)
	update_energy(PlayerStats.energy)

func update_money(v):
	$MoneyLabel.text = "₹ " + str(v)

func update_energy(v):
	$EnergyBar.value = v
