@echo off
call build.bat %1 %2
py gensetup.py %1
echo Generated testbench setup
vsim -do run.do -c