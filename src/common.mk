# These are the build instructions for common file types
# The actual build is done in lower-level directories.  Makefiles in those
# lower level directories include this file and add adaptations
# for specific environments

TLFLAGS += -static
TCFLAGS += -O
TCFLAGS += -g
TCFLAGS += -D_FORTIFY_SOURCE=0
# TCFLAGS = -O2 -fno-optimize-sibling-calls

# VPATH += 

# INCS += 

all: default

t%.o: %.S
	$(TCC) $(INCS) $(DEFS) $(TSFLAGS) -c $< -o $@

t%.o: %.s
	$(TCC) $(INCS) $(DEFS) -c $< -o $@

t%.o: %.c
	$(TCC) $(INCS) $(DEFS) $(TCFLAGS) $(TCPPFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $<

# clean:
#	rm -f *.o
#	rm -f a.out
#	rm -f $(EXTRA_CLEAN)
#	for dir in $(SUBDIRS); do \
#	  $(MAKE) -C $$dir clean; \
#	done
