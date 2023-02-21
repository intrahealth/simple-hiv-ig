@ECHO off
SET tooling_jar=tooling-cli-2.3.0-SNAPSHOT.jar
SET input_cache_path=%~dp0input-cache
SET datadictionary_directory=input/l2/
REM the next 3 lines need to be edited for ANC
SET datadictionary_filename=%datadictionary_directory%\WHO-UCN-HHS-SIA-2022.1-eng.xlsx
SET datadictionary_sheetname="HIV.A. Registration,HIV.B. HTS Visit,HIV.C. PrEP Visit,HIV.D. Care-Treatment Core,HIV.D.Care-Treatment Additional,HIV.D. TB-HIV,HIV.E-F. PMTCT,HIV.G. Diagnostics,HIV.H. Follow Up,HIV.I. Referral,HIV. Surveillance"

SET scope=HIV
SET tooling=%input_cache_path%\%tooling_jar%
SET upper_path=%%~dpx

if EXIST "%tooling%" (
	JAVA -jar "%tooling%" -ProcessAcceleratorKit -s="%scope%" -pts="%datadictionary_filename%" -dep="%datadictionary_sheetname%" -op=.
) ELSE (
	ECHO "%tooling%"
	if EXIST "%tooling%" (
		JAVA -jar $tooling -ProcessAcceleratorKit -s=$scope -pts=./input/l2/"$datadictionary_filename" -dep="$datadictionary_sheetname" -op=.
	) ELSE (
		ECHO [91m ProcessAcceloratorKit NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
		ECHO [0m
    )
)