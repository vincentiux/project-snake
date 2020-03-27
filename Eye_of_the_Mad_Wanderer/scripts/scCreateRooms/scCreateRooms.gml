/// @description  scCreateRooms(rooms, minSize, maxSize);
/// @param rooms
/// @param  minSize
/// @param  maxSize

var rooms = argument0;

var width = 4;
var height = 4;

var startX = 0;
var startY = 0;

var hall1 = choose(0,1);    // Up, down
var hall2 = choose(2,3);    // Left, right

var hallway = choose(hall1,hall2);

var markX = -999;
var markY = -999;

var counter = 0;

// Create Rooms
repeat(rooms){
    counter += 1; // ++ is for losers

    // Tiles
    
    for (iY = 0; iY < height; iY += 1){
        var tileX = choose(0,64);
        var tileY = choose(0,64);
    
        for (iX = 0; iX < width; iX += 1){
            if ((counter == 1) or (abs(counter-rooms) <= 0)){
                if (random(1) < 0.8){
                    var tileX = choose(0,64);
                    var tileY = choose(0,64);
                }
            
                tile_add(tsElevatorTile,tileX,tileY,32,32,startX+(iX*32),startY+(iY*32),5);
            }
            else{
                if (random(1) < 0.5){
                    var tileX = choose(0,64);
                    var tileY = choose(0,64);
                }
            
                tile_add(tsTile,tileX,tileY,32,32,startX+(iX*32),startY+(iY*32),5);
            }
        }
    }
    
    // Walls
    
    for (i = 0; i <= width; i += 1){                                // Horizontal
        if (!((hallway == 0) and (i >= round(width/2)-2) and (i <= round(width/2)+2)) or (counter == rooms)){
            if !((abs(startY-markY) <= 32) and (i >= round(width/2)-2) and (i <= round(width/2)+2)){
                instance_create(startX+(i*32),startY,obWall);
            }
        }
        
        if (!((hallway == 1) and (i >= round(width/2)-2) and (i <= round(width/2)+2)) or (counter == rooms)){
            if !((abs((startY+(height*32))-markY) <= 32) and (i >= round(width/2)-2) and (i <= round(width/2)+2)){
                instance_create(startX+(i*32),startY+(height*32),obWall);
            }
        }
    }
    
    for (i = 0; i <= height; i += 1){                               // Vertical
        if (!((hallway == 2) and (i >= round(height/2)-2) and (i <= round(height/2)+2)) or (counter == rooms)){
            if !((abs(startX-markX) <= 32) and (i >= round(height/2)-2) and (i <= round(height/2)+2)){
                instance_create(startX,startY+(i*32),obWall);
            }
        }
        
        if (!((hallway == 3) and (i >= round(height/2)-2) and (i <= round(height/2)+2)) or (counter == rooms)){
            if !((abs((startX+(width*32))-markX) <= 32) and (i >= round(height/2)-2) and (i <= round(height/2)+2)){
                instance_create(startX+(width*32),startY+(i*32),obWall);
            }
        }
    }
    
    // Hallway
    
    var doorX = 0;
    var doorY = 0;
    
    if (counter != rooms){        
        var length = irandom_range(2,14);
        
        if (hallway == 0){
            for (i = 0; i < length; i += 1){
                instance_create(startX+((round(width/2)-2)*32),startY-(i*32),obWall);
                instance_create(startX+((round(width/2)+2)*32),startY-(i*32),obWall);
                
                doorX = startX+(round(width/2)*32);
                doorY = startY;
                
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32),startY-(i*32),5);
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32)+32,startY-(i*32),5);
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32)+64,startY-(i*32),5);
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32)+96,startY-(i*32),5);
                
                markX = startX+((round(width/2))*32);
                markY = startY-(i*32);
            }
        }
        else if (hallway == 1){
            for (i = 0; i < length; i += 1){
                instance_create(startX+((round(width/2)-2)*32),startY+(height*32)+(i*32),obWall);
                instance_create(startX+((round(width/2)+2)*32),startY+(height*32)+(i*32),obWall);
                
                doorX = startX+(round(width/2)*32);
                doorY = startY+(height*32);
                
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32),startY+(height*32)+(i*32),5);
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32)+32,startY+(height*32)+(i*32),5);
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32)+64,startY+(height*32)+(i*32),5);
                tile_add(tsTile,0,0,32,32,startX+((round(width/2)-2)*32)+96,startY+(height*32)+(i*32),5);
                
                markX = startX+((round(width/2))*32);
                markY = startY+(height*32)+(i*32);
            }
        }
        else if (hallway == 2){
            for (i = 0; i < length; i += 1){
                instance_create(startX-(i*32),startY+((round(height/2)-2)*32),obWall);
                instance_create(startX-(i*32),startY+((round(height/2)+2)*32),obWall);
                
                doorX = startX;
                doorY = startY+(round(height/2)*32);
                
                tile_add(tsTile,0,0,32,32,startX-(i*32),startY+((round(height/2)-2)*32),5);
                tile_add(tsTile,0,0,32,32,startX-(i*32),startY+((round(height/2)-2)*32)+32,5);
                tile_add(tsTile,0,0,32,32,startX-(i*32),startY+((round(height/2)-2)*32)+64,5);
                tile_add(tsTile,0,0,32,32,startX-(i*32),startY+((round(height/2)-2)*32)+96,5);
                
                markX = startX-(i*32);
                markY = startY+((round(height/2))*32);
            }
        }
        else if (hallway == 3){
            for (i = 0; i < length; i += 1){
                instance_create(startX+(width*32)+(i*32),startY+((round(height/2)-2)*32),obWall);
                instance_create(startX+(width*32)+(i*32),startY+((round(height/2)+2)*32),obWall);
                
                doorX = startX+(width*32);
                doorY = startY+(round(height/2)*32);
                
                tile_add(tsTile,0,0,32,32,startX+(width*32)+(i*32),startY+((round(height/2)-2)*32),5);
                tile_add(tsTile,0,0,32,32,startX+(width*32)+(i*32),startY+((round(height/2)-2)*32)+32,5);
                tile_add(tsTile,0,0,32,32,startX+(width*32)+(i*32),startY+((round(height/2)-2)*32)+64,5);
                tile_add(tsTile,0,0,32,32,startX+(width*32)+(i*32),startY+((round(height/2)-2)*32)+96,5);
                
                markX = startX+(width*32)+(i*32);
                markY = startY+((round(height/2))*32);
            }
        }
    }
    
    // Change Vars
    
    if (abs(counter-rooms) <= 1){
        width = irandom_range(4,4);
        height = irandom_range(4,4);
    }
    else{
        width = irandom_range(argument1,argument2);
        height = irandom_range(argument1,argument2);
    }
    
    if (hallway == 0){
        startX = markX-(round(width/2)*32);
        startY = markY-(height*32);
    }
    else if (hallway == 1){
        startX = markX-(round(width/2)*32);
        startY = markY;
    }
    else if (hallway == 2){
        startX = markX-(width*32);
        startY = markY-(round(height/2)*32);
    }
    else if (hallway == 3){
        startX = markX;
        startY = markY-(round(height/2)*32);
    }
    
    if (abs(counter-rooms) > 1){            // Stays the same for last elevator (to place door)
        hallway = choose(hall1,hall2);
    }
}
