.PHONY = clean

PROTO_DIR = proto
GOOGLE_PROTOBUF_INCLUDES = protobuf/src
NANOPB_DIR = nanopb/generator/proto
PROTO_INCLUDES = -I$(PROTO_DIR) -I$(GOOGLE_PROTOBUF_INCLUDES) -I$(NANOPB_DIR)

all: nanopb_pb2.py beerduino_pb2.py

nanopb_pb2.py: $(NANOPB_DIR)/nanopb.proto
	protoc --python_out=. $(PROTO_INCLUDES) $<

%_pb2.py: $(PROTO_DIR)/%.proto
	protoc --python_out=. $(PROTO_INCLUDES) $<

clean:
	rm -rf *_pb2.*