extends Node

signal money_changed(value)
signal energy_changed(value)

var money: int = 1000
var energy: int = 100

const MAX_ENERGY := 100

# ---------- MONEY ----------
func add_money(amount: int):
	money += amount
	emit_signal("money_changed", money)

func spend_money(amount: int) -> bool:
	if money >= amount:
		money -= amount
		emit_signal("money_changed", money)
		return true
	return false

# ---------- ENERGY ----------
func consume_energy(amount: int):
	energy = max(energy - amount, 0)
	emit_signal("energy_changed", energy)

func restore_energy(amount: int):
	energy = min(energy + amount, MAX_ENERGY)
	emit_signal("energy_changed", energy)
