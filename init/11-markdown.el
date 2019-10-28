;;++++++++++++++++++++++++;; 
;; markdown-mode settings ;;
;;++++++++++++++++++++++++;;
(use-package markdown-mode
         :commands (markdown-mode gfm-mode)
         :mode (("\\.md\\'" . gfm-mode)
            ("\\.markdown\\'" . gfm-mode))
         :config
         (setq
          markdown-command "github-markup"
          markdown-command-needs-filename t
          markdown-content-type "application/xhtml+xml"
          markdown-css-paths '("https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css")
          markdown-xhtml-header-content "
<style>
body {
  box-sizing: border-box;
  max-width: 740px;
  width: 100%;
  margin: 40px auto;
  padding: 0 10px;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', () => {
  document.body.classList.add('markdown-body');
});
</script>
" ))
