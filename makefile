#
# Defines Part
#
CROSS ?=
CC := $(CROSS)gcc
CFLAGS := -ggdb3 -Wall -O0
LDFLAGS := -pthread

TARGET_SERVER := udp_server
TARGET_CLIENT := udp_client

.PHONY: all clean distclean

#
# Routines Part
#
all: $(TARGET_SERVER) $(TARGET_CLIENT)

$(TARGET_SERVER): udpserver.o
	$(CC)  $< -o $@ 

$(TARGET_CLIENT): udpclient.o
	$(CC)  $< -o $@ 

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ $(LDFLAGS)

#
# Cleanup Part
#
clean:
	rm -Rf *.o

distclean: clean
	rm -Rf $(TARGET_SERVER) $(TARGET_CLIENT)


