extends Node

const MOD_DIR: = "rin_jugatla-baby_highlighting"
const LOG_NAME: = "rin_jugatla-baby_highlighting:Main"

var mod_dir_path: = ""
var extensions_dir_path: = ""
var translations_dir_path: = ""

func _init() -> void :
	ModLoaderLog.info("Init", LOG_NAME)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)

	install_script_extensions()

func install_script_extensions() -> void :
	extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Scene/UI/PopupUI/UIFarm/animal_box/part_unlocked.gd"))

func _ready() -> void :
	ModLoaderLog.info("Ready", LOG_NAME)
	ModLoaderLog.info("Translation Demo: " + tr("MODNAME_READY_TEXT"), LOG_NAME)
