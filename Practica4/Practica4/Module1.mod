MODULE Module1
        CONST robtarget Target_Home:=[[408.685669492,0,568.405],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20_2:=[[0,0,50],[0,1,0,0],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[0,0,0],[0,1,0,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30_2:=[[0,0,70],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[0,0,20],[0,1,0,0],[0,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!***********************************************************
    !
    ! Módulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    ! Autor: Isabel
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
        Path_10;
    ENDPROC
    PROC Path_10()
        MoveJ Target_Home,v1000,fine,TVentosa\WObj:=wobj0;
        MoveJ Target_20_2,v1000,z100,TVentosa\WObj:=WO_Pieza1;
        MoveL Target_20,v1000,fine,TVentosa\WObj:=WO_Pieza1;
        !SetDO DTool,1;
        MoveL Target_20_2,v1000,z100,TVentosa\WObj:=WO_Pieza1;
        MoveJ Target_30_2,v1000,z100,TVentosa\WObj:=WO_Pieza2;
        MoveL Target_30,v1000,fine,TVentosa\WObj:=WO_Pieza2;
        !SetDO DTool,0;
        MoveL Target_30_2,v1000,z100,TVentosa\WObj:=WO_Pieza2;
        MoveJ Target_Home,v1000,fine,TVentosa\WObj:=wobj0;
    ENDPROC
ENDMODULE