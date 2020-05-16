<mkconfig

VERSION = 0.8.3
CPPFLAGS = $ADDCPPFLAGS \
	-DVERSION=\"$VERSION\"  \
	-D_XOPEN_SOURCE=600 \
	$INC
CFLAGS = $ADDCFLAGS
LDFLAGS = $LIB

SRC = `{ ls *.c }


OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = $NAME

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT
	cp -f $TGT $BIN
	chmod 0755 $BIN/$TGT
uninstall: 
	rm -rf $BIN/$TGT
clean:
	rm -rf $TGT *.o 
