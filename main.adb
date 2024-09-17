with Ada.Text_IO;
with Array_List;

procedure Main is 
    --  A1 is new Array_List (Integer);
    package Int_List is new Array_List (T => Integer);
    A1 : Int_List.Array_List := Int_List.New_List;
begin 
    Int_List.Push_Back(A1, 1);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Int_List.Size(A1)));
    Ada.Text_IO.Put_Line("index 0: " & Integer'Image(Int_List.At_Index(A1, 0)));
end Main;
