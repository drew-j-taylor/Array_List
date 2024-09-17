generic
    type T is private;
    
package Array_List is 
    
    --  type Array_List_Impl;
    type Array_List is private;

    function New_List return Array_List;
    
    procedure Push_Back (A : in out Array_List; Item : T);
    function At_Index (A : Array_List; Position : Natural) return T; 
    function Size (A : Array_List) return Natural;

    --  T front() const;                  // Return the int in position 0, if any
    --  T back() const;                   // Return last element (position n_elems-1)
    --  bool empty() const;                 // Return n_elems == 0

    --  // Mutators
    --  T& operator[](size_t pos);        // Same as at but no bounds checking
    --  void pop_back();                    // --n_elems (nothing else to do; returns nothing)
    --  void erase(size_t pos);             // Remove item in position pos and shuffles following items left
    --  void insert(size_t pos, T item);  // Shuffle items right to make room for a new element
    --  void clear();                       // n_elems = 0 (nothing else to do; keep the current capacity)

    --  // Iterators
    --  T* begin();                       // Return a pointer to 1st element, or nullptr if n_elems == 0
    --  T* end();                         // Return a pointer to 1 past last element, or nullptr if n_elems == 0

    --  // Comparators
    --  bool operator==(const Vector& v) const;
    --  bool operator!=(const Vector& v) const;

private
    CHUNK : Natural := 10;
    type Array_List_Data is array (Natural range <>) of T;
    type Data_Access is access all Array_List_Data;

    type Array_List_Impl is record 
        Capacity : Natural; 
        Num_Elements : Natural; 
        --  Capacity : Natural := CHUNK;
        --  Num_Elements : Natural := 0;
        --  Data : Array_List_Data (0..(CHUNK-1));
        Data : Data_Access;
        --  Data : Array_List_Data;
        --  Data : array (Natural range <>) of T;
    end record;

    type Array_List is access all Array_List_Impl;

    procedure Grow(A : in out Array_List);

    

end Array_List;
