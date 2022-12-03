#!/bin/sh

awk 'BEGIN { FS=","; } NF==3 { 
	gsub(/ /, "", $3); 
	tstr = $3;
	split(tstr,a,"/");
	if( $1 != "name" ) {
		printf("if [ ! -d %s ]; then (mkdir %s); fi; cd %s; if [ ! -d %s ]; then (git clone https://github.com/%s ); else (cd %s; git pull ); fi;pwd; cd ..\n",$2,$2,$2,a[2],$3,a[2]); 
	}
}' final-assignment.txt > f
