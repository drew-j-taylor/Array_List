

package body Array_List is 

    function New_List return Array_List is 
        New_List : Array_List := new Array_List_Impl;
    begin 
        New_List.Capacity := CHUNK;
        New_List.Num_Elements := 0;
        return New_List;
    end New_List;

    --  procedure Grow is 
    --  begin 
    --  end Grow;

    procedure Push_Back (A : in out Array_List; Item : T) is 
    begin 
        --  if A.Num_Elements + 1 >= A.Capacity then 
        --      Grow;
        --  end if;
        A.Data(A.Num_Elements) := Item;
        A.Num_Elements := A.Num_Elements + 1;
    end Push_Back;

    function At_Index (A : Array_List; Position : Natural) return T is 
    begin 
        return A.Data(Position);
    end At_Index;

    function Size (A : Array_List) return Natural is 
    begin 
        return A.Num_Elements;
    end Size;


end Array_List;
