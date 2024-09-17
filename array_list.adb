
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

    function Front(A : Array_List) return T is 
    begin 
        if A.Num_Elements < 1 then 
            raise Constraint_Error;
        end if;
        return A.Data(0);
    end Front;

    function Back(A : Array_List) return T is 
    begin 
        if A.Num_Elements < 1 then 
            raise Constraint_Error;
        end if;
        return A.Data(A.Num_Elements - 1);
    end Back;
    
    procedure Clear (A : Array_List) is 
    begin 
        A.Num_Elements := 0;
    end Clear;

    procedure Pop_Back (A : Array_List) is 
    begin 
        if A.Num_Elements < 1 then 
            raise Constraint_Error;
        end if;
        A.Num_Elements := A.Num_Elements - 1;
    end Pop_Back;

    procedure Erase (A : Array_List; Position : Natural) is 
        Temp_Data : Data_Access := new Array_List_Data (0..(A.Capacity - 1));
    begin 
        if A.Num_Elements <= Position then 
            raise Constraint_Error;
        end if;

        if Position = 0 then 
            -- for(int i = pos; i < (n_elems - 1); i++){ temp_ptr[i] = data_ptr[i+1]; }
            Temp_Data (0..(A.Num_Elements - 2)) := A.Data (1..(A.Num_Elements - 1));
        else 
            Temp_Data (0..(Position - 1)) := A.Data(0..(Position - 1));
            Temp_Data (Position..(A.Num_Elements - 2)) := A.Data ((Position + 1)..(A.Num_Elements - 1));
        end if;

        A.Data := Temp_Data;
        A.Num_Elements := A.Num_Elements - 1;
    end Erase;

    --  procedure Insert (A : Array_List; Position : Natural; Item : T);


    function "=" (L, R : Array_List) return Boolean is 
    begin 
        if 
            L.Num_Elements = R.Num_Elements and then 
            L.Data(0..L.Num_Elements - 1) = R.Data(0..R.Num_Elements - 1) then 
            return True;
        else 
            return False;
        end if;
    end "=";

end Array_List;
