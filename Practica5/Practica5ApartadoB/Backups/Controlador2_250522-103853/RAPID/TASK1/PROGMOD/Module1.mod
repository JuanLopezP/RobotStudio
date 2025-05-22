MODULE Module1
    CONST robtarget Target_10:=[[408.685,0,568.405],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[19.999989664,10.000006428,19.999948885],[-0.000000013,0,1,0.000000005],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[40,40,20],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num h;
    VAR num h_pieza:=20;
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
    VAR num planta;
    VAR num apartado;
    CONST robtarget Target_40:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
        MoveJ Target_10,v1000,z100,TVentosa\WObj:=wobj0;
        WHILE DFin=0 DO
            IF DPieza=1 THEN
                !TPReadNum apartado,"¿Apartado en el que trabajamos? ()";
                apartado:=1;
                IF apartado=0 THEN
                    TPReadNum planta,"¿Número de plantas hasta el que quieres llegar? ()";
                    num_pieza:=planta*4;
                    a:=0;
                    b:=0;
                    a:=num_pieza DIV 4;
                    b:=num_pieza MOD 4;
                    IF a>0 THEN
                        FOR contador2 FROM 1 TO a DO
                            FOR contador FROM 0 TO 3 DO
                                Pick Target_20,WO_pieza;
                                Place Offs(calcula_posicion(contador),0,0,0),WO_Base2;
                                IF (contador=3) THEN
                                    h:=h+2*h_pieza;
                                ENDIF
                            ENDFOR
                        ENDFOR
                    ENDIF
                    IF b>0 THEN
                        FOR contador3 FROM 1 TO b DO
                            Pick Target_20,WO_pieza;
                            Place Offs(calcula_posicion(contador3-1),0,0,0),WO_Base2;
                            IF (contador3=3) THEN
                                h:=h+2*h_pieza;
                            ENDIF
                        ENDFOR
                    ENDIF
                ENDIF
                !APARTADO A
                !FOR contador4 FROM 1 TO num_pieza DO
                !   FOR contador5 FROM 1 TO 4 DO
                !        Pick Target_20, WO_pieza;
                !         Place(Offs(calcula_posicion(contador5 - 1),0,0,0));
                !       IF (contador5 =4) THEN
                !            h := h + 2*h_pieza;
                !        ENDIF
                !   ENDFOR
                !ENDFOR
                !preguntar como terminar el programa
                !******************************************
                !FOR contador5 FROM 1 TO 4 DO
                !               Pick Target_20,WO_pieza;
                !                Place(Offs(calcula_posicion(contador5-1),0,0,0));
                !               pos := contador5-1;
                !               IF (contador5=4) THEN
                !                   h:=h+2*h_pieza;
                !                   plantas_puestas:=plantas_puestas+1;
                !               ENDIF
                !           ENDFOR

                !*************************************************
                !APARTADO B
                IF apartado=1 THEN
                    TPReadNum planta,"¿Número de plantas hasta el que quieres llegar? ()";
                    plantas_totales:=planta-plantas_puestas;
                    IF plantas_totales>0 THEN
                        FOR contador4 FROM 4*plantas_puestas TO (4*planta)-1 DO
                            Pick Target_20,WO_pieza;
                            MoveL Offs(Target_20,0,0,50+5*contador4),v1000,z100,TVentosa\WObj:=WO_Pieza;
                            Place Offs(calcula_posicion(contador4),0,0,0),WO_Base2;
                            IF ((contador4+1) MOD 4)=0 THEN
                                plantas_puestas:=(contador4+1) DIV 4;
                            ENDIF
                        ENDFOR
                    ENDIF
                    IF plantas_totales<0 THEN
                        FOR contador6 FROM (4*plantas_puestas)-1 TO (-(4*plantas_totales)) DO

                            Pick calcula_posicion(contador6),WO_Base2;
                            Place Offs(Target_30,150,-200,100),WO_Base2;
                            IF ((contador6+1) MOD 4)=0 THEN
                                plantas_puestas:=(contador6) DIV 4;
                            ENDIF

                        ENDFOR

                        !h:=h-2*h_pieza;

                    ENDIF

                ENDIF

            ENDIF

        ENDWHILE
        MoveAbsJ JHome,v150,z200,TVentosa\WObj:=WO_Pieza;

    ENDPROC

    PROC Initialize()
        h:=0;
        pos_torre:=0;
        plantas_puestas:=0;
        plantas_totales:=0;
        a:=0;
        b:=0;
        c:=0;
        num_pieza:=0;
        planta:=0;
        apartado:=0;
    ENDPROC

    FUNC robtarget calcula_posicion(num planta)

        a:=planta DIV 4;
        b:=planta MOD 4;

        TEST b
        CASE 0:
            Px:=0;
            Py:=20;
            Pz:=-2*h_pieza*a;

            Rz:=0;
        CASE 1:
            Px:=0;
            Py:=-20;
            Pz:=-2*h_pieza*a;

            Rz:=0;

        CASE 2:
            Px:=-20;
            Py:=0;
            Pz:=-(2*h_pieza*a+h_pieza);

            Rz:=90;
        CASE 3:
            Px:=20;
            Py:=0;
            Pz:=-(2*h_pieza*a+h_pieza);

            Rz:=-90;
        DEFAULT:
        ENDTEST

        punto_orig:=Target_30;
        punto_dest:=RelTool(punto_orig,Px,Py,Pz\Rx:=0,\Ry:=0,\Rz:=Rz);
        RETURN punto_dest;

        !RelTool(Target_30,Px,Py,Pz \Rx := 0 \Ry := 0 \Rz := Rz);

    ENDFUNC

    PROC Pick(robtarget posicion,PERS wobjdata WO)
        MoveL Offs(posicion,0,0,50),v1000,z100,TVentosa\WObj:=WO;
        MoveL posicion,v1000,fine,TVentosa\WObj:=WO;
        SetDO DTool,1;
        MoveL Offs(posicion,0,0,50),v1000,z100,TVentosa\WObj:=WO;
    ENDPROC

    PROC Place(robtarget posicion,PERS wobjdata WO)
        MoveL Offs(posicion,0,0,50),v1000,fine,TVentosa\WObj:=WO;
        MoveL posicion,v1000,fine,TVentosa\WObj:=WO;
        SetDO DTool,0;
        MoveL Offs(posicion,0,0,50),v1000,fine,TVentosa\WObj:=WO;
    ENDPROC


ENDMODULE