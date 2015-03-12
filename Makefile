.PHONY = clean

PROTO_DIR = proto
GOOGLE_PROTOBUF_INCLUDES = protobuf\src
PROTO_INCLUDES = -I$(PROTO_DIR) -I$(GOOGLE_PROTOBUF_INCLUDES)

all: addressbook_pb2.py

%_pb2.py: $(PROTO_DIR)\%.proto
	protoc --python_out=. $(PROTO_INCLUDES) $<

clean:
	rm -rf *_pb2.*