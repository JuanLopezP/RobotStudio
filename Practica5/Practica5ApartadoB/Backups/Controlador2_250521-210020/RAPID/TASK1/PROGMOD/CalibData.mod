MODULE CalibData
    TASK PERS wobjdata Workobject_1:=[FALSE,TRUE,"",[[237.224,146.16,10],[1,0,0,0]],[[50,50,20],[0,0,1,0]]];
    TASK PERS wobjdata CajonDesastre:=[FALSE,TRUE,"",[[237.224,146.16,10],[1,0,0,0]],[[50,50,20],[0,0,1,0]]];
    PERS tooldata TVentosa:=[TRUE,[[0,0,51.19],[1,0,0,0]],[0.1,[0,0,1],[1,0,0,0],0,0,0]];
    TASK PERS wobjdata WO_Pieza:=[FALSE,TRUE,"",[[300,-150,10],[1,0,0,0]],[[20,10,0],[1,0,0,0]]];
    TASK PERS wobjdata WO_Base2:=[FALSE,TRUE,"",[[300,-150,10],[1,0,0,0]],[[0,150,0],[1,0,0,0]]];
    PROC Path_10()
        MoveJ Target_10,v200,z100,TVentosa\WObj:=wobj0;
        MoveL Target_20,v200,fine,TVentosa\WObj:=WO_Pieza;
        MoveL Target_30,v200,z100,TVentosa\WObj:=WO_Base2;
        MoveAbsJ JHome,v1000,z100,TVentosa\WObj:=WO_Pieza;
    ENDPROC
    PROC main()
        Initialize;
        MoveJ Target_10,v200,z100,TVentosa\WObj:=wobj0;
        MoveJ Target_10,v200,z100,TVentosa\WObj:=wobj0;
    ENDPROC
    PROC Initialize()

    ENDPROC
    
  
ENDMODULE