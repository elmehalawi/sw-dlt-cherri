clear
hideKeyboard
echo "Please wait..."
python -m venv $HOME/Documents/SW-DLT/SW-DLT-ENV/
source $HOME/Documents/SW-DLT/SW-DLT-ENV/bin/activate
pip install chardet requests certifi mutagen -q --disable-pip-version-check --upgrade --force-reinstall
pip install yt-dlp yt-dlp-ejs yt-dlp-apple-webkit-jsi gallery-dl -q --disable-pip-version-check --upgrade --force-reinstall
curl -sL https://net00-1.github.io/SW-DLT/api/content/SW_DLT.py -o $HOME/Documents/SW-DLT/SW_DLT.py
deactivate
open shortcuts://
clear && cd
exit