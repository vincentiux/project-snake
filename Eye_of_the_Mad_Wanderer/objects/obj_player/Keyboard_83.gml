/// @DnDAction : YoYo Games.Instances.Get_Instance_Var
/// @DnDVersion : 1
/// @DnDHash : 5E39216D
/// @DnDInput : 3
/// @DnDArgument : "target" "left"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "target_1" "right"
/// @DnDArgument : "target_temp_1" "1"
/// @DnDArgument : "target_2" "bottom"
/// @DnDArgument : "target_temp_2" "1"
/// @DnDArgument : "instvar" "30"
/// @DnDArgument : "instvar_1" "32"
/// @DnDArgument : "instvar_2" "33"
var left = bbox_left;
var right = bbox_right;
var bottom = bbox_bottom;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 444B14D7
/// @DnDArgument : "expr" "d_left and (left > 0) and (bottom < room_height)"
if(d_left and (left > 0) and (bottom < room_height))
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 7772683C
	/// @DnDParent : 444B14D7
	/// @DnDArgument : "x" "0"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "spd/sqrt(2)"
	/// @DnDArgument : "y_relative" "1"
	x += 0;
	y += spd/sqrt(2);

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 5B26DEC9
	/// @DnDParent : 444B14D7
	/// @DnDArgument : "imageind" "anispd/2"
	/// @DnDArgument : "imageind_relative" "1"
	/// @DnDArgument : "spriteind" "sp_left"
	/// @DnDSaveInfo : "spriteind" "b7d7cf42-4600-4b92-b1e6-83dc7d235144"
	sprite_index = sp_left;
	image_index += anispd/2;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 6065B0F4
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 02C0FDFB
	/// @DnDParent : 6065B0F4
	/// @DnDArgument : "expr" "d_right and (right < room_width) and (bottom < room_height)"
	if(d_right and (right < room_width) and (bottom < room_height))
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 7D3E74A3
		/// @DnDParent : 02C0FDFB
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "spd/sqrt(2)"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += spd/sqrt(2);
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 4B9BCAA0
		/// @DnDParent : 02C0FDFB
		/// @DnDArgument : "imageind" "anispd/2"
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "sp_right"
		/// @DnDSaveInfo : "spriteind" "b00409e1-3473-4f5a-a093-aced2831089a"
		sprite_index = sp_right;
		image_index += anispd/2;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 02861143
	/// @DnDParent : 6065B0F4
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 0D53B065
		/// @DnDParent : 02861143
		/// @DnDArgument : "expr" "bottom < room_height"
		if(bottom < room_height)
		{
			/// @DnDAction : YoYo Games.Movement.Jump_To_Point
			/// @DnDVersion : 1
			/// @DnDHash : 7607F6C6
			/// @DnDParent : 0D53B065
			/// @DnDArgument : "x" "0"
			/// @DnDArgument : "x_relative" "1"
			/// @DnDArgument : "y" "spd"
			/// @DnDArgument : "y_relative" "1"
			x += 0;
			y += spd;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 388BD5B9
		/// @DnDParent : 02861143
		else
		{
			/// @DnDAction : YoYo Games.Movement.Jump_To_Point
			/// @DnDVersion : 1
			/// @DnDHash : 237A8ED7
			/// @DnDParent : 388BD5B9
			/// @DnDArgument : "x" "0"
			/// @DnDArgument : "x_relative" "1"
			/// @DnDArgument : "y" "0"
			/// @DnDArgument : "y_relative" "1"
			x += 0;
			y += 0;
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 72AE21AE
		/// @DnDParent : 02861143
		/// @DnDArgument : "var" "dir"
		/// @DnDArgument : "value" "1"
		if(dir == 1)
		{
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 36137307
			/// @DnDParent : 72AE21AE
			/// @DnDArgument : "imageind" "anispd"
			/// @DnDArgument : "imageind_relative" "1"
			/// @DnDArgument : "spriteind" "sp_right"
			/// @DnDSaveInfo : "spriteind" "b00409e1-3473-4f5a-a093-aced2831089a"
			sprite_index = sp_right;
			image_index += anispd;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 41FE9CFD
		/// @DnDParent : 02861143
		else
		{
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 65F7A9C0
			/// @DnDParent : 41FE9CFD
			/// @DnDArgument : "imageind" "anispd"
			/// @DnDArgument : "imageind_relative" "1"
			/// @DnDArgument : "spriteind" "sp_left"
			/// @DnDSaveInfo : "spriteind" "b7d7cf42-4600-4b92-b1e6-83dc7d235144"
			sprite_index = sp_left;
			image_index += anispd;
		}
	}
}