/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7CD35857
/// @DnDArgument : "var" "dir"
/// @DnDArgument : "value" "1"
if(dir == 1)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 4612F81F
	/// @DnDParent : 7CD35857
	/// @DnDArgument : "spriteind" "sp_standing_right"
	/// @DnDSaveInfo : "spriteind" "79d62927-5c5d-4e3f-8935-68efcf08ab7a"
	sprite_index = sp_standing_right;
	image_index = 0;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 59C10E04
else
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 64AD816C
	/// @DnDParent : 59C10E04
	/// @DnDArgument : "spriteind" "sp_standing_left"
	/// @DnDSaveInfo : "spriteind" "450668bd-a1a8-4aa0-ab87-4efb18def211"
	sprite_index = sp_standing_left;
	image_index = 0;
}

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 7250DE3E
speed = 0;