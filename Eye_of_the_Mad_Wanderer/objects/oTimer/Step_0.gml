/// @description Insert description here
// You can write your code in this editor

if(myTime>0){
	myTime=myTime-delta_time/1000000;
	
}else{
	myTime=0;
	dead=true;
	}
showTime=ceil(myTime);