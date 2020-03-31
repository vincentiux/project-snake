/// @DnDAction : YoYo Games.Instances.Get_Instance_Var
/// @DnDVersion : 1
/// @DnDHash : 0AD68042
/// @DnDInput : 3
/// @DnDArgument : "target" "right"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "target_1" "top"
/// @DnDArgument : "target_temp_1" "1"
/// @DnDArgument : "target_2" "bottom"
/// @DnDArgument : "target_temp_2" "1"
/// @DnDArgument : "instvar" "32"
/// @DnDArgument : "instvar_1" "31"
/// @DnDArgument : "instvar_2" "33"
var right = bbox_right;
var top = bbox_top;
var bottom = bbox_bottom;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4AE826DD
/// @DnDArgument : "expr" "d_top or d_bottom"
if(d_top or d_bottom)
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 0CF5890D
	/// @DnDParent : 4AE826DD
	/// @DnDArgument : "expr" "right >= room_width"
	if(right >= room_width)
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 1A158BEF
		/// @DnDParent : 0CF5890D
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "0"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += 0;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 0BD128A2
	/// @DnDParent : 4AE826DD
	else
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 5325150C
		/// @DnDParent : 0BD128A2
		/// @DnDArgument : "x" "spd/sqrt(2)"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "0"
		/// @DnDArgument : "y_relative" "1"
		x += spd/sqrt(2);
		y += 0;
	}

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 056AE7E7
	/// @DnDParent : 4AE826DD
	/// @DnDArgument : "imageind" "anispd/2"
	/// @DnDArgument : "imageind_relative" "1"
	/// @DnDArgument : "spriteind" "sp_right"
	/// @DnDSaveInfo : "spriteind" "b00409e1-3473-4f5a-a093-aced2831089a"
	sprite_index = sp_right;
	image_index += anispd/2;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 75C29B34
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 22E5894F
	/// @DnDParent : 75C29B34
	/// @DnDArgument : "var" "right"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "room_width"
	if(right >= room_width)
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 415BF0CF
		/// @DnDParent : 22E5894F
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "0"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += 0;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 01B71A6C
	/// @DnDParent : 75C29B34
	else
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 270AC726
		/// @DnDParent : 01B71A6C
		/// @DnDArgument : "x" "spd"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "0"
		/// @DnDArgument : "y_relative" "1"
		x += spd;
		y += 0;
	}

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 185E4988
	/// @DnDParent : 75C29B34
	/// @DnDArgument : "imageind" "anispd"
	/// @DnDArgument : "imageind_relative" "1"
	/// @DnDArgument : "spriteind" "sp_right"
	/// @DnDSaveInfo : "spriteind" "b00409e1-3473-4f5a-a093-aced2831089a"
	sprite_index = sp_right;
	image_index += anispd;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 389DA64F
	/// @DnDParent : 75C29B34
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "dir"
	dir = 1;
}