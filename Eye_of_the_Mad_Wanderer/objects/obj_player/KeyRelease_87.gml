/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 302BDF74
/// @DnDArgument : "var" "dir"
/// @DnDArgument : "value" "1"
if(dir == 1)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 454068A0
	/// @DnDParent : 302BDF74
	/// @DnDArgument : "spriteind" "sp_standing_right"
	/// @DnDSaveInfo : "spriteind" "79d62927-5c5d-4e3f-8935-68efcf08ab7a"
	sprite_index = sp_standing_right;
	image_index = 0;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 43A85A43
else
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 3CBFEB4C
	/// @DnDParent : 43A85A43
	/// @DnDArgument : "spriteind" "sp_standing_left"
	/// @DnDSaveInfo : "spriteind" "450668bd-a1a8-4aa0-ab87-4efb18def211"
	sprite_index = sp_standing_left;
	image_index = 0;
}

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 0C631307
speed = 0;