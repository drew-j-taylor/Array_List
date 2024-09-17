generic
    type T is private;
    
package Array_List is 
    
    --  type Array_List_Impl;
    type Array_List is private;

    function New_List return Array_List;
    
    procedure Push_Back (A : in out Array_List; Item : T);
    function At_Index (A : Array_List; Position : Natural) return T; 
    function Size (A : Array_List) return Natural;
private
    CHUNK : Natural := 10;
    type Array_List_Data is array (Natural range <>) of T;

    type Array_List_Impl is record 
        Capacity : Natural; 
        Num_Elements : Natural; 
        --  Capacity : Natural := CHUNK;
        --  Num_Elements : Natural := 0;
        Data : Array_List_Data (0..(CHUNK-1));
    end record;

    type Array_List is access all Array_List_Impl;

    --  procedure Grow(A : in out Array_List);

end Array_List;
