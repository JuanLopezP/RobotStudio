MODULE Module1
    CONST robtarget Target_10:=[[408.685,0,568.405],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[19.999989664,10.000006428,19.999948885],[-0.000000013,0,1,0.000000005],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[40,40,20],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num h;
    VAR num h_pieza := 20;
    CONST jointtarget JHome:=[[0,0,-90,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num pos_torre; 
    VAR num Px;
    VAR num Py;
    VAR num Pz; 
    VAR num Rz; 
    VAR num pos; 
    VAR robtarget punto_orig;
    VAR robtarget punto_dest;
    VAR num num_pieza; 
    VAR num a; 
    VAR num b; 
    VAR num c; 
    VAR num contador4;
    VAR num contador5;
    VAR num plantas_puestas; 
    VAR num plantas_totales; 

    !***********************************************************
    !
    ! Módulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    ! Autor: Juan
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
                TPReadNum num_pieza, "¿Número de plantas hasta el que quieres llegar? ()";
                
                !a := num_pieza DIV 4;
                !b := num_pieza MOD 4;
                !num_pieza := 4*a + b; !Numero de piezas
                !FOR contador2 FROM 1 TO a DO
                !FOR contador FROM 1 TO 4 DO 
                !     Pick Target_20, WO_pieza; 
                !     Place(Offs(calcula_posicion(contador-1),0,0,0));
                !     IF (contador =4) THEN 
                !         h := h + 2*h_pieza;
                !     ENDIF
                !ENDFOR 
                !ENDFOR 
                !FOR contador3 FROM 1 TO b DO 
                !    Pick Target_20, WO_pieza; 
                !     Place(Offs(calcula_posicion(contador3-1),0,0,0));
                !     IF (contador3 =4) THEN 
                !          h := h + 2*h_pieza;
                !     ENDIF
                !ENDFOR 
                !APARTADO A
                FOR contador4 FROM 1 TO num_pieza DO
                    FOR contador5 FROM 1 TO 4 DO 
                        Pick Target_20, WO_pieza; 
                         Place(Offs(calcula_posicion(contador5 - 1),0,0,0));
                        IF (contador5 =4) THEN 
                             h := h + 2*h_pieza;
                        ENDIF
                    ENDFOR 
                ENDFOR
                !preguntar como terminar el programa
                !*************************************************
                !APARTADO B
                !plantas_totales := num_pieza - plantas_puestas;
                !IF plantas_totales > 0 THEN 
                !FOR contador4 FROM 1 TO plantas_totales DO
                    !FOR contador5 FROM 1 TO 4 DO 
                        !Pick Target_20, WO_pieza; 
                         !Place(Offs(calcula_posicion(contador5 - 1),0,0,0));
                        !IF (contador5 =4) THEN 
                             !h := h + 2*h_pieza;
                             !plantas_puestas := plantas_puestas + 1;
                        !ENDIF
                    !ENDFOR 
                !ENDFOR
                !ENDIF
                
                            
            ENDIF
            
        ENDWHILE
        MoveAbsJ JHome,v150,z200,TVentosa\WObj:=WO_Pieza;
        
    ENDPROC
    PROC Initialize()
        h := 0;
        pos_torre := 0;
        plantas_puestas := 0; 
        plantas_totales := 0;
        !contador := 0; 
    ENDPROC
    FUNC robtarget calcula_posicion(num pos_torre)
        TEST pos_torre
        CASE 0:
        Px := 0; 
        Py := -20; 
        Pz := -h;
        
        Rz := 0;
        CASE 1:
        Px := 0; 
        Py := 20; 
        Pz := -h;
        
        Rz := 0;
        CASE 2:
        Px := -20; 
        Py := 0; 
        Pz := -(h+h_pieza);
        
        Rz := 90;
        CASE 3:
        Px := 20; 
        Py := 0; 
        Pz := -(h+h_pieza);
        
        Rz := -90;
        DEFAULT:
        ENDTEST
        
        punto_orig := Target_30;
        punto_dest := RelTool(punto_orig, Px, Py, Pz \Rx:=0, \Ry:=0, \Rz:=Rz);
        RETURN punto_dest;

        !RelTool(Target_30,Px,Py,Pz \Rx := 0 \Ry := 0 \Rz := Rz);
        
    ENDFUNC
    PROC Pick(robtarget posicion,PERS wobjdata WO)
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