@echo off
REM Configure COM5 with a baud rate of 115200 and other parameters
MODE COM5: BAUD=115200 PARITY=N DATA=8 STOP=1

REM Reading from COM5 using PowerShell without newlines and no timeout
echo Waiting for data from COM5...
powershell -Command "$port= new-Object System.IO.Ports.SerialPort COM5,115200,None,8,one; $port.ReadTimeout = -1; $port.WriteTimeout = -1; $port.open(); while ($port.IsOpen) { if ($port.BytesToRead -gt 0) { $data = $port.ReadExisting(); Write-Host -NoNewline $data; } }"
