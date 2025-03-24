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
    CONST robtarget PosInit:=[[408.686,0,722.885],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***********************************************************
    !
    ! Módulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    ! Autor: Javier
    !
    ! Versión: 1.0
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
        !Añada aquí su código
        IF DI0=1 THEN
            Trayectoria1;
            
            Trayectoria2;
           
        ENDIF
    ENDPROC

    PROC Path_20()
        MoveL Target_70,v500,z100,TVentosa\WObj:=wobj0;
        MoveL Target_20,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveL Target_30,v500,fine,TVentosa\WObj:=WO_Pieza1;
        MoveL Target_50,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveL Target_40,v500,fine,TVentosa\WObj:=WO_Pieza2;
        MoveL Target_70,v500,z100,TVentosa\WObj:=wobj0;
    ENDPROC

    PROC Trayectoria1()
        MoveL PosInit,v500,z100,TVentosa\WObj:=wobj0;
        MoveL Aprox1,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveL PosP1,v500,fine,TVentosa\WObj:=WO_Pieza1;
        SetDO DTool,1;
        WaitTime 0.5;
        MoveL Aprox2,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveL PosP2,v500,fine,TVentosa\WObj:=WO_Pieza2;
        SetDO DTool,0;
        WaitTime 0.5;
        MoveL PosInit,v500,z100,TVentosa\WObj:=wobj0;
    ENDPROC

    PROC Trayectoria2()
        MoveL PosP2,v500,fine,TVentosa\WObj:=WO_Pieza2;
        MoveL Aprox2,v500,z100,TVentosa\WObj:=WO_Pieza2;
        MoveL Aprox1,v500,z100,TVentosa\WObj:=WO_Pieza1;
        MoveL PosP1,v500,fine,TVentosa\WObj:=WO_Pieza1;
        MoveL PosInit,v500,z100,TVentosa\WObj:=wobj0;
    ENDPROC
ENDMODULE