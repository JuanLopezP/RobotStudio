MODULE Module1
    CONST robtarget Target_70:=[[408.686,0,722.885],[0.500000007,0,0.8660254,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[25,15,70],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[25,15,20],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[50,50,170],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[50,50,120],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[408.686,0,722.885],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PosInit_2:=[[408.686,0,722.885],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Aprox2:=[[50,50,170],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PosP2:=[[50,50,120],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Aprox2_2:=[[50,50,170],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Aprox1:=[[25,15,70],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PosP1:=[[25,15,20],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PosInit:=[[408.685802155,0,568.40465738],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***********************************************************
    !
    ! M�dulo:  Module1
    !
    ! Descripci�n:
    !   <Introduzca la descripci�n aqu�>
    !
    ! Autor: Javier
    !
    ! Versi�n: 1.0
    !
    !***********************************************************


    !***********************************************************
    !
    ! Procedimiento Main
    !
    !   Este es el punto de entrada de su programa
    !
    !***********************************************************
    PROC main()
        !A�ada aqu� su c�digo
        IF DI0=1 THEN
            Trayectoria1;
            
            Trayectoria2;
           
        ENDIF
    ENDPROC

    PROC Trayectoria1()
        MoveJ PosInit,v500,z100,TVentosa\WObj:=wobj0;
        MoveJ Aprox1,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveL PosP1,v500,fine,TVentosa\WObj:=WO_Pieza1;
        SetDO DTool,1;
        WaitTime 0.5;
        MoveL Aprox1,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveJ Aprox2,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveL PosP2,v500,fine,TVentosa\WObj:=WO_Pieza2;
        SetDO DTool,0;
        WaitTime 0.5;
        MoveL Aprox2,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveJ PosInit,v500,z100,TVentosa\WObj:=wobj0;
    ENDPROC

    PROC Trayectoria2()
        MoveJ PosInit,v500,z100,TVentosa\WObj:=wobj0;
        MoveJ Aprox2,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveL PosP2,v500,fine,TVentosa\WObj:=WO_Pieza2;
        SetDO DTool,1;
        MoveL Aprox2,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveJ Aprox1,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveL PosP1,v500,fine,TVentosa\WObj:=WO_Pieza1;
        SetDO DTool,0;
        MoveJ Aprox1,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveJ PosInit,v500,z100,TVentosa\WObj:=wobj0;
        
    ENDPROC
  
ENDMODULE