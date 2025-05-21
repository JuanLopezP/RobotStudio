MODULE Module1
    CONST robtarget Target_10:=[[408.685,0,568.405],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[19.999989664,10.000006428,19.999948885],[-0.000000013,0,1,0.000000005],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[40,40,20],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num h;
    CONST jointtarget JHome:=[[0,0,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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

    PROC main()
        !Añada aquí su código
        Initialize;
        MoveJ Target_10,v200,z100,TVentosa\WObj:=wobj0;
        WHILE DFin = 0 DO
            IF DPieza = 1 THEN
               Pick(Target_20); 
               Place(Offs(Target_30,0,0,h));
               h := h + 20;
            ENDIF
        ENDWHILE
        MoveAbsJ JHome,v150,z200,TVentosa\WObj:=WO_Pieza;
        
    ENDPROC
    PROC Initialize()
        h := 0;
    ENDPROC

    PROC Pick(robtarget posicion)
        MoveL Offs(posicion,0,0,50),v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveL posicion,v200,fine,TVentosa\WObj:=WO_Pieza;
        SetDO DTool,1;
        MoveL Offs(posicion,0,0,50),v200,z100,TVentosa\WObj:=WO_Pieza;
    ENDPROC
    PROC Place(robtarget posicion)
        MoveL Offs(posicion,0,0,50),v500,fine,TVentosa\WObj:=WO_Base2;
        MoveL posicion,v200,fine,TVentosa\WObj:=WO_Base2;
        SetDO DTool,0;
        MoveL Offs(posicion,0,0,50),v200,fine,TVentosa\WObj:=WO_Base2;
    ENDPROC
    PROC Path_10()
        MoveJ Target_10,v200,z100,TVentosa\WObj:=wobj0;
        MoveL Target_20,v200,fine,TVentosa\WObj:=WO_Pieza;
        MoveL Target_30,v200,z100,TVentosa\WObj:=WO_Base2;
        MoveAbsJ JHome,v200,z100,TVentosa\WObj:=WO_Pieza;
    ENDPROC

ENDMODULE