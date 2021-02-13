slimline::section::user_host_info::render() {
  if (( ! ${SLIMLINE_ALWAYS_SHOW_USER_HOST_INFO:-0} )) && \
      [[ -z "${SSH_TTY}" && ${UID} -ne 0 ]]; then
    return;
  fi

  local -A variables=("user" "%n" "host" "%m")
  if [[ -z "${SSH_TTY}" && ${UID} -eq 0 ]]; then
    slimline::utils::expand "user_host_info_root" "%F{red}|user|%f" ${(kv)variables}
    return;
  fi
  if [[ ${UID} -eq 0 ]]; then
    slimline::utils::expand "user_host_info_root" "%F{red}|user|%F{white}@%F{yellow}|host|%f" ${(kv)variables}
  else
    slimline::utils::expand "user_host_info" "%F{green}|user|%F{white}@%F{yellow}|host|%f" ${(kv)variables}
  fi
}
