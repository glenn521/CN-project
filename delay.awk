#Initial the program, and set max packetID# to 0
BEGIN {
highest_uid = 0;
}
#Define every column of the tr file
{
event = $1; #first column means that actions such as receiving and sendin.
time = $2;	#time
node_nb = $3;	#node number


node_nb=substr(node_nb,2,1);	#in tr file, node number is like _3_, but we only need 3, so we remove ‘_’
trace_type = $4;	#trac_type such as Mac
flag = $5;		#
uid = $6;		#packetID


pkt_type = $7;	#Packet type
pkt_size = $8;	#packet size

# Record the max CBR packet ID in Mac, and assign this ID to highest _uid

if ( event=="s" && node_nb== "_0_" && pkt_type=="RTS" && uid > highest_uid && trace_type=="MAC")
	{
		highest_uid = uid;
	}

	#record the packet sending time and save into start_time array

	if ( event=="s" && node_nb=="_0_" && pkt_type=="RTS" && uid==highest_uid&&trace_type=="MAC" && pkt_size="44")

{
	start_time[uid] = time;
}

#record the packet receiving time and save into end_time array

if ( event=="r" && node_nb == "_1_" && pkt_type=="ACK" && uid==highest_uid && trace_type=="MAC" && pkt_size="38")

end_time[uid] = time;
}
END {

# calculate the delay time

for ( packet_id = 0; packet_id <= highest_uid; packet_id++ )
{
start = start_time[packet_id];
end = end_time[packet_id];
packet_duration = end - start;
#print out the positive delay time
if ( start <end )
print packet_id, packet_duration >> "csma_delay.tr"

#printf("%d %f\n", packet_id, packet_duration);

	}
}






























