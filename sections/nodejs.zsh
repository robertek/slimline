slimline::section::nodejs::precmd() {
  unset slimline_section_nodejs_output
}

slimline::section::nodejs::async_task() {
  echo "$(node -v 2>/dev/null)"
}

slimline::section::nodejs::async_task_complete() {
  local output="${3}"
  slimline_section_nodejs_output="${output}"
}

slimline::section::nodejs() {
  if [[ ! -f "package.json" && ! -d "node_modules" ]]; then return; fi
  if [[ -z "${slimline_section_nodejs_output}" ]]; then return; fi
  local format="%F{white}[%F{green}⬢ |version|%F{white}]%f"
  slimline::utils::expand "${SLIMLINE_NODEJS_FORMAT:-${format}}" "version" "${slimline_section_nodejs_output}"
}
