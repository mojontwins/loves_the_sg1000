# This makefile was created looking several examples,
# for instance ZGB's or CPCTelera's

SRCDIR = .
OBJDIR = rel

CC = sdcc.exe
CFLAGS = -mz80 --peep-file lib/peep-rules.txt --peep-asm
LFLAGS = -mz80 --no-std-crt0 --data-loc 0xC000

SRC:=$(wildcard $(SRCDIR)/*.c) $(wildcard $(SRCDIR)/assets/*.c) $(wildcard $(SRCDIR)/engine/*.c) $(wildcard $(SRCDIR)/utils/*.c) 
OBJ:=$(patsubst $(SRCDIR)%, $(OBJDIR)%, $(SRC:%.c=%.rel))
DEP:=$(patsubst $(SRCDIR)%, $(OBJDIR)%, $(SRC:%.c=%.d))

define COMPILEC
$(1): $(2)
	mkdir -p $(dir $(1))
	$(CC) $(CFLAGS) -M $(2) -o $(3)	
	sed -i -E "s/(.+)\.rel/$(subst /,\/,$(dir $(1)))\1.rel/" $(3)
	$(CC) $(CFLAGS) -c $(2) -o $(1)
endef

all: cart.sg

cart.sg: cart.ihx
	../../../src/utils/ihx2sms.exe cart.ihx cart.sg
	@rm -r *.ihx
	@rm -r *.lk
	@rm -r *.noi

cart.ihx: $(OBJ)
	$(CC) -o cart.ihx $(LFLAGS) lib/crt0_sg.rel  $^   lib/PSGlib.rel lib/SGlib.rel lib/aPLib.rel

$(foreach OBJF, $(OBJ), $(eval $(call COMPILEC, $(OBJF), $(patsubst $(OBJDIR)%, $(SRCDIR)%, $(OBJF:%.rel=%.c)), $(OBJF:%.rel=%.d))))

-include $(DEP)

.PHONY: clean 
clean: 
	@rm -rf $(OBJDIR) cart.sg
