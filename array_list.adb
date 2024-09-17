
package body Array_List is 

    function New_List return Array_List is 
        New_List : Array_List := new Array_List_Impl;
    begin 
        New_List.Capacity := CHUNK;
        New_List.Num_Elements := 0;
        New_List.Data := new Array_List_Data(0 .. CHUNK - 1);
        return New_List;
    end New_List;

    procedure Grow (A : in out Array_List) is 
        Cap_Growth : Float := Float(A.Capacity) * 1.6;
        New_Cap : Natural := Natural(Cap_Growth);
        New_Data : Data_Access := new Array_List_Data (0..(New_Cap - 1));
    begin 
        New_Data (0..(A.Capacity - 1)) := A.Data (0..(A.Capacity - 1));
        A.Data := New_Data;
        A.Capacity := New_Cap;
    end Grow;

    procedure Push_Back (A : in out Array_List; Item : T) is 
    begin 
        if A.Num_Elements + 1 >= A.Capacity then 
            Grow(A);
        end if;
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
