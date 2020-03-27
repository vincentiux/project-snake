/// @description  Refresh

if (refresh){    
    var left = instance_place(x-32,y,obWall);
    var right = instance_place(x+32,y,obWall);
    var up = instance_place(x,y-32,obWall);
    var down = instance_place(x,y+32,obWall);
    
    if (up and down){
        image_index = 0;
    }
    else if (left and right){
        image_index = 1;
    }
    else if (down and right){   // Top-left corner
        image_index = 2;
    }
    else if (down and left){   // Top-right corner
        image_index = 3;
    }
    else if (up and left){   // Bottom-right corner
        image_index = 4;
    }
    else if (up and right){   // Bottom-left corner
        image_index = 5;
    }
    
    refresh = false;
}

