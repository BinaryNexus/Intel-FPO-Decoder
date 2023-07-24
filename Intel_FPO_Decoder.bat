@echo off
title Intel(R) CPU FPO/Batch Code Decoder
echo.
color 09
echo ______________________________________________________________
echo.
echo  Welcome to Binary_Nexus' Intel(R) CPU FPO/Batch Code Decoder
echo ______________________________________________________________
echo.
pause
cls
echo Enter BGA or LGA socket number, "C" for Coprocessor, "G" for Xe GPU, or type "S" to skip:
set /p  socket=
REM BGA
if %socket%==437 goto B10
if %socket%==441 goto B10
if %socket%==518 goto B10
if %socket%==559 goto B10
if %socket%==592 goto B10s
if %socket%==617 goto B10s
if %socket%==676 goto B10
if %socket%==951 goto B10
if %socket%==956 goto B10
if %socket%==1023 goto B10
if %socket%==1168 goto B10s
if %socket%==1170 goto B10s
if %socket%==1224 goto B10
if %socket%==1234 goto B10s
if %socket%==1288 goto B10
if %socket%==1296 goto B10s
if %socket%==1356 goto B10s
if %socket%==1364 goto B10s
if %socket%==1380 goto B10s
if %socket%==1440 goto B20
if %socket%==1449 goto B20
if %socket%==1466 goto B10
if %socket%==1499 goto B20
if %socket%==1526 goto B20
if %socket%==1598 goto B20
if %socket%==1744 goto B20
if %socket%==1781 goto B20
if %socket%==1787 goto B20
if %socket%==1964 goto B20
if %socket%==2270 goto B20
REM LGA
if %socket%==771 goto 0s
if %socket%==775 goto 0s
if %socket%==1150 goto 10s
if %socket%==1151 goto 10s
if %socket%==1155 goto 10s
if %socket%==1156 goto 10
if %socket%==1200 goto 20s
if %socket%==1248 goto 10
if %socket%==1356 goto 10s
if %socket%==1366 goto 10
if %socket%==1567 goto 10
if %socket%==1700 goto 20s
if %socket%==2011 goto 10s
if %socket%==2066 goto 10s
if %socket%==3647 goto 10s
if %socket%==4189 goto 20s
if %socket%==4677 goto 20s
if %socket%==7529 goto 20s
if %socket%==S goto S
if %socket%==G goto gpu
if %socket%==C goto copro

:S
set range=skip
goto plants
:0s
set range=0s
set soctype=CPU, LGA %socket%
goto plants
:10
set range=10
set soctype=CPU, LGA %socket%
goto plants
:10s
set range=10s
set soctype=CPU, LGA %socket%
goto plants
:20
set range=20
set soctype=CPU, LGA %socket%
goto plants
:20s
set range=20s
set soctype=CPU, LGA %socket%
goto plants
:B0s
set range=0s
set soctype=CPU, BGA %socket%
goto plants
:B10
set range=10
set soctype=CPU, BGA %socket%
goto plants
:B10s
set range=10s
set soctype=CPU, BGA %socket%
goto plants
:B20
set range=20
set soctype=CPU, BGA %socket%
goto plants
:B20s
set range=20s
set soctype=CPU, BGA %socket%
goto plants
:gpu
set range=20
set soctype=Xe GPU
goto plants
:copro
set soctype=Xeon Phi Coprocessor
set range=10
goto plants

:plants
cls

echo Enter FPO string:
set /p fpo=

REM set variables now, otherwise they won't be properly set

set year=200%fpo:~1,1%
set week=%fpo:~2,2%
set batch=%fpo:~4,4%


if %fpo:~0,1%==0 goto CR
if %fpo:~0,1%==1 goto PH
if %fpo:~0,1%==2 goto US
if %fpo:~0,1%==3 goto CR
if %fpo:~0,1%==4 goto US
if %fpo:~0,1%==5 goto CH
if %fpo:~0,1%==6 goto US
if %fpo:~0,1%==7 goto PH
if %fpo:~0,1%==8 goto IR
if %fpo:~0,1%==9 goto MA
if %fpo:~0,1%==A goto MA
if %fpo:~0,1%==C goto US
if %fpo:~0,1%==D goto Unknown
if %fpo:~0,1%==E goto PHCH
if %fpo:~0,1%==G goto JA
if %fpo:~0,1%==I goto MAUS
if %fpo:~0,1%==J goto US
if %fpo:~0,1%==K goto KO
if %fpo:~0,1%==L goto MA
if %fpo:~0,1%==M goto Unknown
if %fpo:~0,1%==O goto PH
if %fpo:~0,1%==P goto US
if %fpo:~0,1%==Q goto MA
if %fpo:~0,1%==R goto PH
if %fpo:~0,1%==T goto Unknown
if %fpo:~0,1%==U goto PH
if %fpo:~0,1%==V goto CH
if %fpo:~0,1%==X goto VI
if %fpo:~0,1%==Y goto IR
if %fpo:~0,1%==Z goto Unknown


:CR
set plant=Costa Rica
goto continue1
:PH
set plant=Philippines
goto continue1
:US
set plant=United States
goto continue1
:CH
set plant=China
goto continue1
:IR
set plant=Ireland
goto continue1
:MA
set plant=Malaysia
goto continue1
:PHCH
set plant=Philippines/China
goto continue1
:JA
set plant=Japan
goto continue1
:MAUS
set plant=Malaysia/United States
goto continue1
:KO
set plant=Korea
goto continue1
:VI
set plant=Vietnam
goto continue1
:Unknown
set plant=Unknown
goto continue1


:continue1

::if %fpo:~1,1%==0 goto A
::if %fpo:~1,1%==1 goto A
::if %fpo:~1,1%==2 goto A
::if %fpo:~1,1%==3 goto A
::if %fpo:~1,1%==4 goto A
::if %fpo:~1,1%==5 goto A
::if %fpo:~1,1%==6 goto A
::if %fpo:~1,1%==7 goto B
::if %fpo:~1,1%==8 goto B
::if %fpo:~1,1%==9 goto B
if %range%==0s goto A
if %range%==10 goto B
if %range%==10s goto C
if %range%==20 goto D
if %range%==20s goto E
if %range%==skip goto F

:A
set year=200%fpo:~1,1%
goto continue2

:B
if %fpo:~1,1% leq 5 goto C
if %fpo:~1,1% geq 6 goto A
goto continue2

:C
set year=201%fpo:~1,1%
goto continue2

:D
if %fpo:~1,1% leq 5 goto E
if %fpo:~1,1% geq 6 goto C
goto continue2

:E
set year=202%fpo:~1,1%
goto continue2

:F
set year=200%fpo:~1,1% OR 201%fpo:~1,1% OR 202%fpo:~1,1%
goto continue2

:continue2
cls
echo Format: %soctype%
echo Plant: %plant%
echo Year: %year%
echo Week: %week%
echo Batch Number: %batch%
echo.
echo.
echo Note: Week 0  - 12   -   Q1
echo       Week 13 - 25   -   Q2
echo       Week 26 - 38   -   Q3
echo       Week 39 - 52   -   Q4
cd %localhost%
echo %fpo% - %soctype%, %plant% ¦ Week %week% of %year% ¦ Batch %batch% ¦ (%date% @ %time%)>> FPODecoder.log
pause