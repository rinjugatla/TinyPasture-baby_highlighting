extends "res://Scene/UI/PopupUI/UIFarm/animal_box/part_unlocked.gd"

const BABY_ICON_NODE_NAME = "TEX_BabyIcon"
const BABY_ICON_PATH = "res://mods-unpacked/rin_jugatla-baby_highlighting/extensions/Assets/UI/baby_icon.png"
static var baby_icon_texture = ImageTexture.create_from_image(Image.load_from_file(BABY_ICON_PATH))

var tex_baby_icon: TextureRect = null

func _ready() -> void:
	_create_baby_icon_node()

## 赤ちゃん用アイコン用ノードを作成
func _create_baby_icon_node() -> void:
	var has_baby_icon_node = get_node(BABY_ICON_NODE_NAME)
	if has_baby_icon_node:
		return
	
	tex_baby_icon = tex_locked_icon.duplicate()
	
	tex_baby_icon.texture = baby_icon_texture
	tex_baby_icon.name = BABY_ICON_NODE_NAME
	tex_baby_icon.scale = Vector2(0.4, 0.4)
	tex_baby_icon.position = Vector2(17, 17)
	tex_baby_icon.visible = false
	
	var parent_node = $TEX_LockedIcon.get_owner()
	parent_node.add_child(tex_baby_icon)

func setup(new_animal: AnimalSave):
	super(new_animal)
	
	if animal:
		tex_baby_icon.visible = !animal.is_adult

func _process(_delta: float) -> void :
	super(_delta)
	
	if animal:
		tex_baby_icon.visible = !animal.is_adult
