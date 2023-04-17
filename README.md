<button onclick="copyToClipboard('yes 1 | bash <(curl -s https://raw.githubusercontent.com/crossdefalt/quick-nethunter-rootless/main/bash.sh)')">Copy Command</button>

<script>
function copyToClipboard(text) {
  const el = document.createElement('textarea');
  el.value = text;
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
  alert('Command copied to clipboard');
}
</script>
