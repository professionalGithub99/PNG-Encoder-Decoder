import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
module {
  public func alpha_separate(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_alpha_index:Nat):(Buffer.Buffer<Buffer.Buffer<Nat8>>,Bool){
    let replacement_buffer=Buffer.Buffer<Buffer.Buffer<Nat8>>(_pixels.size());
    for(i in _pixels.vals()){
      if(i.get(_alpha_index)==255){
        replacement_buffer.add(remove_alpha(i,_alpha_index));
      }
      else{
        let empty_buffer=Buffer.Buffer<Buffer.Buffer<Nat8>>(0);
        return (empty_buffer,false);
      }
    };
    return (replacement_buffer,true);
  };


  //this method assumes size of buffer is 4
  public func remove_alpha(_channels:Buffer.Buffer<Nat8>,_alpha_index:Nat):Buffer.Buffer<Nat8>{
    var size=3;
    var replacement_buffer=Buffer.Buffer<Nat8>(size);
    for(i in Iter.range(0,size-1)){
      if(i!=_alpha_index){
        replacement_buffer.add(_channels.get(i));
      }
    };
    return replacement_buffer;
  };
  /*public func alpha_separate<A>(_pixels:Buffer.Buffer<Buffer.Buffer<A>>,_alpha_index:Nat,_alpha_sample_max:Nat,eq:(A,A)->Bool):(Buffer.Buffer<Buffer.Buffer<A>>,Bool){
    let replacement_buffer=Buffer.Buffer<Buffer.Buffer<A>>(_pixels.size());
    for(i in _pixels){
      if(eq(i.get(_alpha_index),
    };
  };*/

  /*public func indexing(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_index_hashmap:HashMap.HashMap<Buffer.Buffer<Nat8>,Nat>):(Buffer.Buffer<Nat>,HashMap.HashMap<Buffer.Buffer<Nat8>,Nat>,Bool){
        var replacement_buffer=Buffer.Buffer<Nat>(_pixels.size());
  	for(i in _pixels.vals()){
	     if(_index_hashmap.get(i)==null){
                if(_index_hasmap.size()>255){
		//______TODO: RETURN A BlANKD HAHSMAP______
		return (Buffer.Buffer<Nat>(0),_index,false);
		}
		else{
		_index_hashmap.put(i,_index_hashmap.size());
		}
	     }
	replacement_buffer.add(_index_hashmap.get(i));
  	};
	return(replacement_buffer,_index_hashmap,true);
  };*/
}
