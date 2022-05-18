import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
module {
        public type Otions={
		width:?Nat;
		height:?Nat;
	};
	//take in a buffer and options
	/*public func encode(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_options:Options):{
	//reads in file completely checks if alpha channel is maximum value for all 
	//if so alpha_separate
	};*/
/*	public func alpha_separate(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>):Buffer.Buffer<Buffer.Buffer<Nat8>>{
	         let alpha_index=3; 
		 let replacement_buffer=Buffer.Buffer<Buffer.Buffer<Nat8>>(_pixels.size());
                 for(i in _pixels){
		      replacement_buffer.add(remove_alpha(i));
		 };
		 return replacement_buffer;
	};

        //this method assumes size of buffer is 4
	public func remove_alpha(_channels:Buffer.Buffer<Nat8>):Buffer.Buffer<Nat8>{
	         var size=3;
	         var replacement_buffer=Buffer.Buffer<Nat8>(size);
		 for(i in Iter.range(0,size-1)){
                      replacement_buffer.add(replacement);
		 };
		 return replacement_buffer;
		};*/
	public func check_all_alpha (_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_alpha_index:Nat):Bool{
	 	assert(_pixels.get(0).getOpt(_alpha_index)!=null);
		for(i in _pixels.toArray().vals()){
			if(i.get(_alpha_index)!=255){
				return false;
			};
		};
		return true;
	};
}
