<button onclick="copyToClipboard('yes 1 | bash <(curl -s https://raw.githubusercontent.com/crossdefalt/quick-nethunter-rootless/main/bash.sh)')">Copy Command</button>

<script>
function copyToClipboard(text) {
  var textarea = document.createElement("textarea");
  textarea.value = text;
  document.body.appendChild(textarea);
  textarea.select();
  document.execCommand("copy");
  document.body.removeChild(textarea);
  alert("Command copied to clipboard");
}
</script>
