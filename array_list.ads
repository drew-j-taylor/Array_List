generic
    type T is private;
    with function "=" (L, R : T) return Boolean is <>;
    
package Array_List is 
    
    type Array_List_Impl is private;
    type Array_List is access all Array_List_Impl;

    function New_List return Array_List;
    
    procedure Push_Back (A : in out Array_List; Item : T);
    function At_Index (A : Array_List; Position : Natural) return T; 
    function Size (A : Array_List) return Natural;

    function Front(A : Array_List) return T;
    function Back(A : Array_List) return T;
    procedure Clear (A : Array_List);

    procedure Pop_Back (A : Array_List);
    procedure Erase (A : Array_List; Position : Natural);
    procedure Insert (A : in out Array_List; Position : Natural; Item : T);

    function "=" (L, R : Array_List) return Boolean;

private
    CHUNK : Natural := 10;
    type Array_List_Data is array (Natural range <>) of T;
    type Data_Access is access all Array_List_Data;

    type Array_List_Impl is record 
        Capacity : Natural; 
        Num_Elements : Natural; 
        Data : Data_Access;
    end record;

    procedure Grow(A : in out Array_List);

end Array_List;
