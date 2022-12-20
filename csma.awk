#!/usr/bin/awk  -f
BEGIN {
     last = 0
     tcp_drp = 0
     cbr_drp = 0
     total_drp = 0
	#print "TIME\tTCP\tCBR\tTOT"
	#print "-----------------------------------------"

}
{
       
   action = $1;

   time = $2;

   from = $3;

   to = $4;

   type = $5;

   packet_type = $7;

   pktsize = $6;

   flow_id = $8;

   src = $9;

   dst = $10;

   seq_no = $11;

   packet_id = $12; 


	
#	if (type == "tcp" && action == "d") 
#    
#                    tcp_drp += 1
    
#	if (type == "cbr" && action == "d") 
 #                   cbr_drp += 1
    
     

     #packet drop every second
  #   if (time -  1 > last) {
  #          last = time	
  	
  	
  	
  	if(from == "_0_" && action == "s" && packet_type == "RTS" )
            print action, time, from, packet_type >> "tcpdrp.tr"
        
            
        if(from == "_1_" && action == "r" && packet_type == "ACK" )
            print action, time, from, packet_type >> "tcpdrp.tr"    
            
            
  #          print time, cbr_drp >> "cbrdrp.tr"
#	    print time , cbr_drp + tcp_drp >> "totdrp.tr"  
 #           tcp_drp = 0r
 #           cbr_drp = 0
 #           total_drp = 0

    # }

 }

END {
       #print time , packet_type >> "tcpdrp.tr"
 #      print time , cbr_drp >> "cbrdrp.tr"
       #print time , cbr_drp + tcp_drp >> "totdrp.tr"   
#	print("total TCP packets dropped:", tcp_drp); 
#  	        print("total UDP packets dropped:", cbr_drp);
#      	        print("total packets dropped:", tcp_drp+cbr_drp);       	
 }


