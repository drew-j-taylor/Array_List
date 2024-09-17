with Ada.Text_IO;
with Array_List;

procedure Main is 
    --  A1 is new Array_List (Integer);
    package Int_List is new Array_List (T => Integer);
    A1 : Int_List.Array_List := Int_List.New_List;

    package Char_List is new Array_List (T => Character);
    A2 : Char_List.Array_List := Char_List.New_List;

    --  package Str_List is new Array_List (T => String);
    --  A3 : Str_List.Array_List := Str_List.New_List;
begin 
    Int_List.Push_Back(A1, 1);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Int_List.Size(A1)));
    Ada.Text_IO.Put_Line("index 0: " & Integer'Image(Int_List.At_Index(A1, 0)));

    --  Char_List.Push_Back(A2, 'a');
    for char in Character'Val(65)..Character'Val(122) loop 
        Char_List.Push_Back(A2, char);
        Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    end loop;
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    Ada.Text_IO.Put_Line("index 0: " & Char_List.At_Index(A2, 0));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;

    --  Str_List.Push_Back(A3, "abcd");
    --  Ada.Text_IO.Put_Line(Str_List.At_Index(0));
end Main;
