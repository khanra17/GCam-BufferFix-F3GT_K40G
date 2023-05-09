# MD5s
MD5_ORG_12="75fc5153a83b82e16d7a70e43943e518"
MD5_MOD_12="ac50dee1d39f801dee09dbdc094011d4"
MD5_MOD_14="e2cfbb0972f0601253dd0b576e531a48"

# Define the file paths
SYS_FILE="/system/vendor/lib64/libmtkcam_featurepolicy.so"
MOD_12_FILE="$MODPATH"/system/vendor/lib64/libmtkcam_featurepolicy.so_12
MOD_14_FILE="$MODPATH"/system/vendor/lib64/libmtkcam_featurepolicy.so

# get md5 of SYS_FILE
SYS_MD5=$(md5sum "$SYS_FILE" | awk '{print $1}')

# switch md5s
if [ "$SYS_MD5" == "$MD5_ORG_12" ]; then
  ui_print "Installing 12.x.x"
  rm "$MOD_14_FILE"
  mv "$MOD_12_FILE" "$MOD_14_FILE"
elif [ "$SYS_MD5" == "$MD5_MOD_12" ]; then
  abort "Already patched Firmware 12.x.x"
else
  ui_print "Installing 14.x.x"
  rm "$MOD_12_FILE"
fi

# Set permissions on the file
set_perm "$MOD_14_FILE" 0 0 0644
