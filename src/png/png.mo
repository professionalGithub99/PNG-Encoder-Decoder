import Buffer "mo:base/Buffer"
module {
	public type reference_stream = Buffer.Buffer<Buffer.Buffer<Nat8>>;
	let PNGHEADER:[Nat8]=[0x89,0x50,0x4E,0x47,0x0D,0x0A,0x1A,0x0A];
}
