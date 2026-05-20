LATEST_VERSION="https://net00-1.github.io/SW-DLT/api/updates/latest.json"
WORKSPACE="$HOME/Documents/SW-DLT"
LAST_CHECK_TS="$WORKSPACE/shortcut_update_ts.txt"
CURRENT_DATE=$(date +%s)
CURRENT_VERSION="__CURRENT_VERSION__"

if [ ! -f $LAST_CHECK_TS ]
then echo 0 > $LAST_CHECK_TS
fi

TS_DATE=$(cat $LAST_CHECK_TS)
DATE_DIFF=$(($CURRENT_DATE - $TS_DATE))

if [ $((DATE_DIFF / 86400)) -ge 1 ]
then VER_CHECK=$(curl -sL $LATEST_VERSION)
    date +%s > $LAST_CHECK_TS
    if [ "$CURRENT_VERSION" != $(echo $VER_CHECK | jq -r ".version") ]
    then echo $VER_CHECK
    fi
fi