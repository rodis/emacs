(require 'jabber-autoloads)

(load "~/.emacs.d/.jabber-auth.el") ; erc-password
(setq 
      jabber-vcard-avatars-retrieve nil
      jabber-auto-reconnect t
      jabber-chat-buffer-format "*-jabber-%n-*"
      jabber-alert-message-hooks '(
                                   jabber-message-libnotify 
                                   ;; jabber-message-echo 
                                   jabber-message-scroll)
      jabber-alert-presence-hooks nil
      jabber-message-alert-same-buffer nil
      jabber-roster-line-format " %a %c %-35n %u %-8s"
      jabber-roster-subscription-display '(
                                           ("none" . "  ") 
                                           ("from" . "←") 
                                           ("to" . "→") 
                                           ("both" . "⇄"))
      jabber-show-resources 'never
      jabber-roster-show-title nil
      jabber-roster-show-bindings nil
      ;; jabber-chat-foreign-prompt-format "> "
      ;; jabber-chat-local-prompt-format "> "
      ;; jabber-chat-system-prompt-format "*** "
      jabber-chat-fill-long-lines nil
)

(custom-set-faces
 '(jabber-chat-prompt-foreign ((t (:foreground "red"))))
 '(jabber-chat-prompt-local ((t (:foreground "blue"))))
 '(jabber-chat-prompt-system ((t (:foreground "dark green" :weight bold))))
 '(jabber-roster-user-away ((t (:foreground "orange"))))
 '(jabber-roster-user-chatty ((t (:foreground "green"))))
 '(jabber-roster-user-online ((t (:foreground "dark green"))))
 '(jabber-title-medium 
   ((t (:inherit variable-pitch :weight bold :height 1.0 :width expanded))))
)

(add-hook 'jabber-chat-mode-hook 'goto-address)


(provide 'rds-jabber)
