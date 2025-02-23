{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
    extraPackages = epkgs: with epkgs; [
      catppuccin-theme
      company
      doom-modeline
      magit
      markdown-mode
      nix-mode
      org-roam
      org-roam-ui
    ];
    extraConfig = ''
      ;; Backup directory in ~/.emacs.d/backups
      (let ((backup-dir "~/.emacs.d/backups"))
        (unless (file-exists-p backup-dir)
          (make-directory backup-dir))
        (setq backup-directory-alist `(("." . ,backup-dir))))
      
      ;; Autosave directory in ~/.emacs.d/autosaves
      (let ((autosave-dir "~/.emacs.d/autosaves"))
        (unless (file-exists-p autosave-dir)
          (make-directory autosave-dir))
        (setq auto-save-file-name-transforms
              `((".*" ,(concat autosave-dir "/\\1") t))))

      ;; Apply catppuccin theme
      (setq catppuccin-flavor 'mocha)
      (load-theme 'catppuccin t)
      
      ;; Set IBM Plex Mono font
      (set-frame-font "BlexMono Nerd Font 10" nil t)
      
      ;; Disable GUI elements
      (menu-bar-mode -1)
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      
      ;; Enable doom-modeline
      (add-hook 'after-init-hook #'doom-modeline-mode)

      ;; Use spaces instead of tabs globally
      (setq-default indent-tabs-mode nil)
      
      ;; Set the default tab width to 4 spaces (optional, adjust as needed)
      (setq-default tab-width 4)

      ;; Set up modes for files
      (with-eval-after-load 'auto-mode-alist
        (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))
      
      ;; Set up auto completion with company-mode
      (autoload 'company "company-mode" "Company mode for text completion." t)
      (with-eval-after-load 'company
        (setq company-idle-delay 0.1)
        (setq company-minimum-prefix-length 2)
        (setq company-tooltip-align-annotations t)
        (add-to-list 'company-backends 'company-capf))
      (add-hook 'prog-mode-hook 'company-mode)
      
      ;; Set up eglot lsp
      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs '(nix-mode . ("${pkgs.nil}/bin/nil")))
        (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("${pkgs.llvmPackages.clang-tools}/bin/clangd")))
        (add-to-list 'eglot-server-programs '(java-mode . ("${pkgs.jdt-language-server}/bin/jdtls"))))
      
      ;; Set up nix mode
      (add-hook 'nix-mode-hook
                  (lambda ()
                    (setq nix-nixfmt-bin "${pkgs.nixfmt-rfc-style}/bin/nixfmt")
                    (eglot-ensure)
                    (add-hook 'before-save-hook #'nix-format-buffer nil t)))
      
      ;; Set up c mode
      (add-hook 'c-mode-hook 'eglot-ensure)
      
      ;; Set up c++ mode
      (add-hook 'c++-mode-hook 'eglot-ensure)
      
      ;; Set up java mode
      (add-hook 'java-mode-hook 'eglot-ensure)
      
      ;; Line numbers
      (autoload 'display-line-numbers-mode "display-line-numbers" "View line numbers." t)
      (with-eval-after-load 'display-line-numbers
        (setq display-line-numbers-type 'relative))
      (add-hook 'prog-mode-hook 'display-line-numbers-mode)
      
      ;; Remove trailing whitespace
      (add-hook 'before-save-hook 'delete-trailing-whitespace)

      (require 'org)
      (with-eval-after-load 'org-roam
        (setq org-roam-directory (file-truename "~/docs/notes"))
        (setq org-roam-completion-everywhere t)
        (org-roam-db-autosync-mode))

      ;; Enable which-key-mode globally
      (which-key-mode)
      
      ;; Set default keybindings for window movement
      (windmove-default-keybindings)
      
      ;; Set keybinds for org-roam
      (global-set-key (kbd "C-c n l") #'org-roam-buffer-toggle)
      (global-set-key (kbd "C-c n f") #'org-roam-node-find)
      (global-set-key (kbd "C-c n i") #'org-roam-node-insert)
      (global-set-key (kbd "C-c n c") #'org-roam-capture)
      (global-set-key (kbd "C-c n j") #'org-roam-dailies-capture-today)
      (global-set-key (kbd "C-c n t") #'org-roam-dailies-goto-today)
    '';
  };
}
