
l
Command: %s
1870*	planAhead27
#open_checkpoint top_demo_routed.dcp2default:defaultZ12-2866h px? 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.057 . Memory (MB): peak = 324.258 ; gain = 0.0002default:defaulth px? 
V
Loading part %s157*device2#
xc7z020clg484-12default:defaultZ21-403h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0202default:default2
827.4302default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
512default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2022.22default:defaultZ1-479h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
L
*Restoring timing data from binary archive.264*timingZ38-478h px? 
F
$Binary timing data restore complete.265*timingZ38-479h px? 
L
*Restoring constraints from binary archive.481*projectZ1-856h px? 
E
#Binary constraint restore complete.478*projectZ1-853h px? 
?
Reading XDEF placement.
206*designutilsZ20-206h px? 
D
Reading placer database...
1602*designutilsZ20-1892h px? 
=
Reading XDEF routing.
207*designutilsZ20-207h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
Read XDEF Files: 2default:default2
00:00:002default:default2 
00:00:00.2802default:default2
1527.5862default:default2
14.5552default:defaultZ17-268h px? 
?
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
0.0000002default:default2
0.0000002default:defaultZ20-1924h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common20
Finished XDEF File Restore: 2default:default2
00:00:002default:default2 
00:00:00.2812default:default2
1527.5862default:default2
14.5552default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1527.5862default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
'Checkpoint was created with %s build %s378*project2+
Vivado v2022.2 (64-bit)2default:default2
36719812default:defaultZ1-604h px? 
?
vOpenCheckpoint Checksum | Checksum: 1eeb52dbe
----- Checksum: PlaceDB: 6408eacb ShapeSum: 976df625 RouteDB: f33e4cce 
*commonh px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
open_checkpoint: 2default:default2
00:00:212default:default2
00:00:232default:default2
1527.5862default:default2
1203.3282default:defaultZ17-268h px? 
h
Command: %s
53*	vivadotcl27
#write_bitstream -force top_demo.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
G
"No user IP repositories specified
1154*coregenZ19-1704h px? 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2022.2/data/ip2default:defaultZ19-2313h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2L
 "6
driver/smol_clkdriver/smol_clk2default:default2default:default2?
 "p
,driver/FSM_sequential_CURRENT_STATE[1]_i_2/O,driver/FSM_sequential_CURRENT_STATE[1]_i_2/O2default:default2default:default2?
 "l
*driver/FSM_sequential_CURRENT_STATE[1]_i_2	*driver/FSM_sequential_CURRENT_STATE[1]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2Y
 "C
nolabel_line70/div/E[0]nolabel_line70/div/E2default:default2default:default2?
 "v
/nolabel_line70/div/game_reg[nextstate][1]_i_2/O/nolabel_line70/div/game_reg[nextstate][1]_i_2/O2default:default2default:default2?
 "r
-nolabel_line70/div/game_reg[nextstate][1]_i_2	-nolabel_line70/div/game_reg[nextstate][1]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "r
-nolabel_line70/game_reg[updatesignal]_i_1_n_1-nolabel_line70/game_reg[updatesignal]_i_1_n_12default:default2default:default2?
 "n
+nolabel_line70/game_reg[updatesignal]_i_1/O+nolabel_line70/game_reg[updatesignal]_i_1/O2default:default2default:default2?
 "j
)nolabel_line70/game_reg[updatesignal]_i_1	)nolabel_line70/game_reg[updatesignal]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2P
 ":
test/hdmi_pll/CLKtest/hdmi_pll/CLK2default:default2default:default2~
 "h
(test/hdmi_pll/clk_audio_counter[5]_i_3/O(test/hdmi_pll/clk_audio_counter[5]_i_3/O2default:default2default:default2z
 "d
&test/hdmi_pll/clk_audio_counter[5]_i_3	&test/hdmi_pll/clk_audio_counter[5]_i_32default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 2 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "l
*driver/FSM_sequential_CURRENT_STATE[1]_i_2	*driver/FSM_sequential_CURRENT_STATE[1]_i_22default:default2default:default2?
 "l
*driver/FSM_sequential_CURRENT_STATE_reg[0]	*driver/FSM_sequential_CURRENT_STATE_reg[0]2default:default"l
*driver/FSM_sequential_CURRENT_STATE_reg[1]	*driver/FSM_sequential_CURRENT_STATE_reg[1]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 8 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2z
 "d
&test/hdmi_pll/clk_audio_counter[5]_i_3	&test/hdmi_pll/clk_audio_counter[5]_i_32default:default2default:default2?
 "?
atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[0]	atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[0]2default:default"?
atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[1]	atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[1]2default:default"?
atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[2]	atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[2]2default:default"?
atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[3]	atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[3]2default:default"?
atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[4]	atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[4]2default:default"?
atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[5]	atest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/clk_audio_counter_reg[5]2default:default"?
ltest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/internal_clk_audio_counter_wrap_reg	ltest/hdmi/true_hdmi_output.packet_picker/audio_clock_regeneration_packet/internal_clk_audio_counter_wrap_reg2default:default"?
Otest/hdmi/true_hdmi_output.packet_picker/audio_sample_word_transfer_control_reg	Otest/hdmi/true_hdmi_output.packet_picker/audio_sample_word_transfer_control_reg2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
uPS7 block required: The PS7 cell must be used in this Zynq design in order to enable correct default configuration.%s*DRC2;
 #DRC|PS7|Zynq requires PS7 block|PS72default:default8ZZPS7-1h px? 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 7 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
_
Writing bitstream %s...
11*	bitstream2"
./top_demo.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
222default:default2
72default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:192default:default2
00:00:172default:default2
2023.7812default:default2
496.1952default:defaultZ17-268h px? 


End Record