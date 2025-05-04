function isCmdExist() {
	local cmd="$1"
  	if [ -z "$cmd" ]; then
		echo "Usage isCmdExist yourCmd"
		return 1
	fi

	which "$cmd" >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		return 0
	fi

	return 2
}

function autoCmdInstall() {
  local cmd=$1
  local install_cmd=$2
  isCmdExist $cmd
  if [ $? -ne 0 ]; then
    sudo apt-get install $install_cmd -y
  fi
}