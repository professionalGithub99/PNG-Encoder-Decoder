import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
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

  public func indexing(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_index_hashmap:HashMap.HashMap<Buffer.Buffer<Nat8>,Nat>):(Buffer.Buffer<Nat>,HashMap.HashMap<Buffer.Buffer<Nat8>,Nat>,Bool){
    var replacement_buffer=Buffer.Buffer<Nat>(_pixels.size());
    for(i in _pixels.vals()){
      if(_index_hashmap.get(i)==null){
        if(_index_hashmap.size() > 255){
          return (Buffer.Buffer<Nat>(0),_index_hashmap,false);
        }
        else{
          _index_hashmap.put(i,_index_hashmap.size());
        }
      };
      var pixel=_index_hashmap.get(i);
      switch(pixel){
        case(null){};
        case(?pixel){
          replacement_buffer.add(pixel);
        };
      }
    };
    return(replacement_buffer,_index_hashmap,true);
  };

  public func RGB_merge(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_alpha_index:?Nat):(Buffer.Buffer<Buffer.Buffer<Nat8>>,Bool){
    // loop through entire pixels
    var replacement_buffer=Buffer.Buffer<Buffer.Buffer<Nat8>>(_pixels.size());
    var pixel_value=_pixels.get(0).get(0);
    switch(_alpha_index){
      case(?_alpha_index){
        if(_alpha_index==0){
pixel_value := _pixels.get(0).get(1);
        }
      };
    };
    for(i in Iter.range(0,_pixels.size()-1)){
      for(j in Iter.range(0,_pixels.get(i).size()-1)){
        if(_pixels.get(i).get(j)!=pixel_value){
          switch(_alpha_index){
            case(?alpha_index){
              if(alpha_index!=j){
                return (Buffer.Buffer<Buffer.Buffer<Nat8>>(0),false);
              }
            };
            case(null){
              return (Buffer.Buffer<Buffer.Buffer<Nat8>>(0),false);
            };
          };
        }
      };
      var replacement_pixel=Buffer.Buffer<Nat8>(2);
      replacement_pixel.add(pixel_value);
      switch(_alpha_index){
        case(?_alpha_index){
          replacement_pixel.add(_pixels.get(i).get(_alpha_index));
        }
      };
      replacement_buffer.add(replacement_pixel);
    };
    return (replacement_buffer,true);
  };
public func get_transparent_pixels(_pixels:Buffer.Buffer<Buffer.Buffer<Nat8>>,_alpha_index:Nat, _pixels_transparent:HashMap.HashMap<Buffer.Buffer<Nat8>,Bool>):HashMap.HashMap<Buffer.Buffer<Nat8>,Bool>{
  //loop through _pixels 
  //create a buffer that contains the 3 values of the pixel excluding the alpha value
  //check if the pixel is already in _pixels_transparent
  //if the value of that pixel is 1 move on
  //else check if the pixel's current_alpha is 0.
  //If it is do _tranparent_pixel_status.put(pixel,true)
  //else do _pixels_transparent.put(pixel,false)
  for(i in _pixels.vals(){
  var current_pixel_no_alpha= Buffer.Buffer<Nat8>(3);
    for(j in Iter.range(0,i.size(i)-1)){
      if(j!=_alpha_index){
        current_pixel_no_alpha.add(i.get(j));
      }
      }
      switch(_pixels_transparent.get(current_pixel_no_alpha)){
        case(?_tps){
          if(_tps==true){
            if(i.get(alpha_index)!=0){
              _pixels_transparent.put(_tps,false);
            }
          }
        };
        case(null){
            if(i.get(alpha_index)!=0){
              _pixels_transparent.put(_tps,false);
            }
            else{
              _pixels_transparent.put(current_pixel_no_alpha,true);
            }
        }
      };
    }
    return _pixels_transparent;
};
  /*public func alpha_separate<A>(_pixels:Buffer.Buffer<Buffer.Buffer<A>>,_alpha_index:Nat,_alpha_sample_max:Nat,eq:(A,A)->Bool):(Buffer.Buffer<Buffer.Buffer<A>>,Bool){
    let replacement_buffer=Buffer.Buffer<Buffer.Buffer<A>>(_pixels.size());
    for(i in _pixels){
    if(eq(i.get(_alpha_index),
    };
    };*/
}
