MODULE Module1
    CONST robtarget PosInit_10:=[[408.685,0,568.405],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogidaPadre:=[[10,30,20],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogida1:=[[0,-150,0],[0,-0.707106781,0.707106781,0],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogida2:=[[0,0,0],[0,-0.707106781,0.707106781,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PuntoRecogida3:=[[0,150,0],[0,-0.707106781,0.707106781,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget Jhome:=[[0,0,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget PosInit:=[[0,0,0,0,0,120],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num contador:=0;
    VAR num seleccion:=0;
    !Con esto puedo seleccionar la torre elegida por el usuario
    VAR num hpieza:=20;
    VAR num torre1:=0;
    VAR num torre2:=0;
    VAR num torre3:=0;
    VAR num altura:=0;
    


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
        Initialize;
        !MoveJ PosInit_10,v500,z10,TVentosa\WObj:=wobj0;
        !MoveAbsJ PosInit,v500,z100,TVentosa\WObj:=wobj0;

        FOR contador FROM 1 TO 10 DO
            
            !TPReadNum seleccion, "¿Dónde ponemos la pieza? (1, 2 o 3)";
            seleccion := 1;
            IF contador >= 3 THEN 
                seleccion := 2;
            ENDIF
            IF contador >= 6 THEN 
                seleccion := 3;
            ENDIF
            
            IF seleccion=1 THEN
                Pick(PuntoRecogidaPadre);
                altura := torre1;
                Place(PuntoRecogida1);
                torre1:=torre1+hpieza;
            ENDIF

            IF seleccion=2 THEN
                Pick(PuntoRecogidaPadre);
                altura := torre2;
                Place(PuntoRecogida2);
                torre2:=torre2+hpieza;
            ENDIF

            IF seleccion=3 THEN
                Pick(PuntoRecogidaPadre);
                altura := torre3;
                Place(PuntoRecogida3);
                torre3:=torre3+hpieza;
            ENDIF
        ENDFOR
        MoveAbsJ Jhome,v500,z100,TVentosa\WObj:=wobj0;


    
    ENDPROC

PROC Initialize()
    ! Este solo es como el inicio del programa simplemente sirve para inicializar variables a un cierto valor pero OJO no para declararlas
    contador:=0;
    

ENDPROC

PROC Pick(robtarget PuntoRecogidaPadre)
    VAR robtarget punto_aprox;
    punto_aprox:=Offs(PuntoRecogidaPadre,0,0,50);
    ! 50 mm por encima

   
    MoveJ punto_aprox,v500,z10,TVentosa\WObj:=WO_Pieza;
    MoveL PuntoRecogidaPadre,v50,fine,TVentosa\WObj:=WO_Pieza;

    SetDO DTool,1;
    WaitTime 0.5;

    MoveL punto_aprox,v500,z10,TVentosa\WObj:=WO_Pieza;

ENDPROC

PROC Place(robtarget Punto)
    VAR robtarget PuntoMesa;
    VAR robtarget punto_aprox_1;
    PuntoMesa:=Offs(Punto,0,0,altura+hpieza);
    punto_aprox_1:=Offs(PuntoMesa,0,0,50);
    ! 50 mm por encima


    MoveJ punto_aprox_1,v500,z10,TVentosa\WObj:=WO_Base;
    MoveL PuntoMesa,v50,fine,TVentosa\WObj:=WO_Base;

    SetDO DTool,0;
    WaitTime 0.5;

    MoveL punto_aprox_1,v500,z10,TVentosa\WObj:=WO_Base;
    !MoveJ PosInit_10,v500,z10,TVentosa\WObj:=wobj0;

ENDPROC
    PROC Trayectoria()
        MoveJ PosInit_10,v1000,z100,TVentosa\WObj:=wobj0;
        MoveJ PuntoRecogidaPadre,v1000,z100,TVentosa\WObj:=WO_Pieza;
        MoveJ PuntoRecogida1,v1000,z100,TVentosa\WObj:=WO_Base;
        MoveJ PuntoRecogida2,v1000,z100,TVentosa\WObj:=WO_Base;
        MoveJ PuntoRecogida3,v1000,z100,TVentosa\WObj:=WO_Base;
        MoveAbsJ Jhome,v1000,z100,TVentosa\WObj:=wobj0;
    ENDPROC

ENDMODULE
