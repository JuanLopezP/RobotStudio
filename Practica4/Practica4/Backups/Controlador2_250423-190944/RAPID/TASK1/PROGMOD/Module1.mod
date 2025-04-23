MODULE Module1
        CONST robtarget PosInit_10:=[[408.685,0,568.405],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoAcercamiento:=[[10,30,50],[0,-0.707106781,0.707106781,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogidaPadre:=[[10,30,20],[0,-0.707106781,0.707106781,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoAcercamiento1:=[[0,-150,30],[0,-0.707106781,0.707106781,0],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogida1:=[[0,-150,0],[0,-0.707106781,0.707106781,0],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoAcercamiento2:=[[0,0,30],[0,-0.707106781,0.707106781,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogida2:=[[0,0,0],[0,-0.707106781,0.707106781,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoAcercamiento3:=[[0,150,30],[0,-0.707106781,0.707106781,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogida3:=[[0,150,0],[0,-0.707106781,0.707106781,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
        Trayectoria;
        !Añada aquí su código
    ENDPROC
    PROC Trayectoria()
        MoveJ PosInit_10,v500,z100,TVentosa\WObj:=wobj0;
        MoveJ PuntoAcercamiento,v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveL PuntoRecogidaPadre,v500,fine,TVentosa\WObj:=WO_Pieza;
        SetDO DTool,1;
        MoveJ PuntoAcercamiento,v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveJ PuntoAcercamiento1,v500,z100,TVentosa\WObj:=WO_Base;
        MoveL PuntoRecogida1,v500,fine,TVentosa\WObj:=WO_Base;
        SetDO DTool,0;
        MoveJ PuntoAcercamiento1,v500,z100,TVentosa\WObj:=WO_Base;
        MoveJ PuntoAcercamiento,v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveL PuntoRecogidaPadre,v500,fine,TVentosa\WObj:=WO_Pieza;
        SetDO DTool,1;
        MoveJ PuntoAcercamiento,v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveJ PuntoAcercamiento2,v500,z100,TVentosa\WObj:=WO_Base;
        MoveL PuntoRecogida2,v500,fine,TVentosa\WObj:=WO_Base;
        SetDO DTool,0;
        MoveJ PuntoAcercamiento2,v500,z100,TVentosa\WObj:=WO_Base;
        MoveJ PuntoAcercamiento,v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveL PuntoRecogidaPadre,v500,fine,TVentosa\WObj:=WO_Pieza;
        SetDO DTool,1;
        MoveJ PuntoAcercamiento,v500,z100,TVentosa\WObj:=WO_Pieza;
        MoveJ PuntoAcercamiento3,v500,z100,TVentosa\WObj:=WO_Base;
        MoveL PuntoRecogida3,v500,z100,TVentosa\WObj:=WO_Base;
        SetDO DTool,0;
        MoveJ PuntoAcercamiento3,v500,z100,TVentosa\WObj:=WO_Base;
        MoveJ PosInit_10,v500,z100,TVentosa\WObj:=wobj0;
    ENDPROC
    PROC Initialize()
        
        
    ENDPROC
    PROC Pick()
        
    ENDPROC
    PROC Place()
        
    ENDPROC
    
ENDMODULE
