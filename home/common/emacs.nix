# [[file:../../README.org::*Nix Config][Nix Config:1]]
{ pkgs, ... }:

{
  home.packages = with pkgs; [ nil ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
    extraPackages = epkgs: with epkgs; [
      markdown-mode
      company
      catppuccin-theme
      nix-mode
      magit
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

      ;; Use spaces instead of tabs globally
      (setq-default indent-tabs-mode nil)
      
      ;; Set the default tab width to 4 spaces (optional, adjust as needed)
      (setq-default tab-width 4)

      ;; Set up modes for files
      (with-eval-after-load 'auto-mode-alist
        (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))
      
      ;; Set up auto completion with company-mode
      (autoload 'company "company-mode" "Company mode for text completion." t)
      (add-hook 'prog-mode-hook 'company-mode)
      (with-eval-after-load 'company
        (setq company-idle-delay 0.1)
        (setq company-minimum-prefix-length 2)
        (setq company-tooltip-align-annotations t)
        (add-to-list 'company-backends 'company-capf))
      
      ;; Set up eglot lsp
      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(nix-mode . ("${pkgs.nil}/bin/nil"))))
      
      (with-eval-after-load 'nix-mode
        (setq nix-nixfmt-bin "${pkgs.nixfmt-rfc-style}/bin/nixfmt")
        (add-hook 'nix-mode-hook 'eglot-ensure)
        (add-hook 'nix-mode-hook
                  (lambda ()
                    (add-hook 'before-save-hook #'nix-format-buffer nil t))))
    '';
  };
}
# Nix Config:1 ends here
