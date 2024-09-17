with Ada.Text_IO;
with Array_List;

procedure Main is 
    package Int_List is new Array_List (T => Integer);
    A1 : Int_List.Array_List := Int_List.New_List;
    A0 : Int_List.Array_List := Int_List.New_List;

    package Char_List is new Array_List (T => Character);
    A2 : Char_List.Array_List := Char_List.New_List;

    package Float_List is new Array_List (T => Float);
    A4 : Float_List.Array_List := Float_List.New_List;
    F1 : Float;
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

    Int_List.Push_Back(A0, 1);
    Ada.Text_IO.Put_Line(Boolean'Image(Int_List."="(A0, A1)));
    Ada.Text_IO.Put_Line(Boolean'Image(Int_List."/="(A0, A1)));

    F1 := Float_List.Front(A4);
    Ada.Text_IO.Put_Line(Float'Image(F1));
    exception
        when Constraint_Error =>
            Ada.Text_IO.Put_Line("Front out of range");
    Float_List.Push_Back(A4, 0.0);
    Ada.Text_IO.Put_Line(Float'Image(Float_List.Front(A4)));

    Ada.Text_IO.Put_Line("Back: " & Char_List.Back(A2));
    Char_List.Pop_Back(A2);
    Ada.Text_IO.Put_Line("Back: " & Char_List.Back(A2));

    Char_List.Clear(A2);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));

    for i in Character range 'a'..'f' loop 
        Char_List.Push_Back(A2, i);
    end loop;

    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;
    Ada.Text_IO.New_Line;
    Char_List.Erase(A2, 2);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;

end Main;
