import Buffer "mo:base/Buffer";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Nat8 "mo:base/Nat8";
import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
module {
  public type HastoArray<A> ={
toArray:() ->[A];
  };
  public func twod_buffer_to_twod_array(_buffer:Buffer.Buffer<Buffer.Buffer<Nat8>>):[[Nat8]]{
    var buf:HastoArray<Nat8> =Buffer.Buffer<Nat8>(1);
    var arr = Array.init<[Nat8]>(_buffer.size(),[]);
    for(i in Iter.range(0,_buffer.size()-1))
    {
      arr[i] := _buffer.get(i).toArray();
    };
    return Array.freeze(arr);
  };
  public func buffer_eq(_buffer1:Buffer.Buffer<Nat8>,_buffer2:Buffer.Buffer<Nat8>):Bool{
    if(_buffer1.size() != _buffer2.size())
    {
      return false;
    };
    for(i in Iter.range(0,_buffer1.size()-1))
    {
      if(_buffer1.get(i) != _buffer2.get(i))
      {
        return false;
      };
    };
    return true;
  };
  public func hash_buffer(_buffer:Buffer.Buffer<Nat8>):Hash.Hash{
    var concat_text="";
    for(i in Iter.range(0,_buffer.size()-1))
    {
      var current_element_as_text=Nat8.toText(_buffer.get(i));
      while(current_element_as_text.size() < 3)
      {
current_element_as_text:="0"#current_element_as_text;
      };
concat_text:=concat_text#current_element_as_text;
    };
    return Text.hash(concat_text);
  };

  public func buffer_to_array(_buffer:Buffer.Buffer<Nat8>):[Nat8]{
    return _buffer.toArray();
  };
   
   public func flip_hashmap<A,B>(_hashmap:HashMap.HashMap<A,B>,_keyEq:(B,B)->Bool,keyHash:B->Hash.Hash):HashMap.HashMap<B,A>{
    var new_hashmap:HashMap.HashMap<B,A> =HashMap.HashMap<B,A>(_hashmap.size(),_keyEq,keyHash);
    for(key in _hashmap.keys())
    {
      var value=_hashmap.get(key);
      switch(value)
      {
       case(null){
       Debug.trap("flip_hashmap: value is null");
       };
       case(?value){
        new_hashmap.put(value,key);
       };
      };
    };
    return new_hashmap;
    };
  //messing with generics
  /*public func twod_buffer_to_twod_array(_buffer:Buffer.Buffer<Buffer.Buffer<Nat8>>):[[Nat8]]{
    var buf:HastoArray<Nat8> =_buffer.get(0);
    var arr_test:[var [Nat8]] =[var [3,3]];
    arr_test[0]:= buf.toArray();
    return Array.freeze(arr_test);
  /*var arr = Array.init<[Nat8]>(_buffer.size(),[]);
  for(i in Iter.range(0,_buffer.size()-1))
  {
  arr[i] := _buffer.get(i).toArray();
  };
  return Array.freeze(arr);*/
};*/
}
