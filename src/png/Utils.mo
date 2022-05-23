import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
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
}
