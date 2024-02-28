# Tutorial 3 Game Development CSUI Even Semester 2023/2024
Created by Stefanus Ndaru Wedhatama - 2006526812

## Excercise
### New Features
#### Double Jump
Double jump di tutorial ini dilakukan di pecahan kode berikut
```gd
var double_jump = false

func get_input():
	if is_on_floor():
		double_jump = true
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
	if !is_on_floor() and Input.is_action_just_pressed('ui_up') and double_jump:
		velocity.y = jump_speed
		double_jump = false
```
Implementasi double jump menggunakan mekanik dari `boolean` untuk menentukan apakah karakter _eligible_ untuk double jump. Ketika karakter menyentuh tanah, maka status double jump akan menyala. Lalu, jika tidak berada di tanah, alias ketika karakter sedang jatuh atau sedang melompat, maka karakter dapat melompat lagi, menghasilkan double jump. Implementasi ini juga kebetulan memberikan kemampuan bagi karakter untuk air jump, alias lompat di udara sebanyak satu kali.

#### Crouching
Crouching di tutorial ini dilakukan di pecahan kode berikut
```gd
	if Input.is_action_pressed('ui_down'):
		$CollisionShape2D.get_shape().set_extents(
				Vector2(base_size.x, base_size.y/2))
		$Sprite.set_scale(
				Vector2(base_scale.x, base_scale.y/2))
		speed = 200
	else:
		$CollisionShape2D.get_shape().set_extents(
				Vector2(base_size.x, base_size.y))
		$Sprite.set_scale(
				Vector2(base_scale.x, base_scale.y))
		speed = 400
```
Implementasi crouching diimplementasikan dengan memanipulasi (transformasi) dari `CollisionShape2D` dan `Sprite` sehingga seolah karakter sedang crouching. Crouching dilakukan dengan menahan tombol `ui_down`, dan ketika crouching, karakter akan menjadi setengah dari tinggi aslinya, dan kecepatan juga berkurang menjadi `400` unit. Saat crouching, `CollisionShape2D` dan `Sprite` akan ditransformasi dengan discale menjadi setengah tinggi aslinya.
