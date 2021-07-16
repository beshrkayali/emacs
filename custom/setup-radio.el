;;; setup-radio.el -- sumamry
;;; Commentary:

;; Radio channels

;;; Code:

;; Radio
(use-package
  eradio
  :custom (eradio-player
	   '("mpv"
	     "--no-video"
	     "--no-terminal"))
  (eradio-channels
   '(
     ("P1" . "https://sverigesradio.se/topsy/direkt/132-mp3.m3u")
     ("P2" . "https://http-live.sr.se/p2musik-aac-320")
     ("P3" . "https://sverigesradio.se/topsy/direkt/164-mp3.m3u")
     ("Ekot" . "https://sverigesradio.se/topsy/direkt/4540-mp3.m3u")
     ("P4 Plus Stockholm" . "https://sverigesradio.se/topsy/direkt/701-mp3.m3u")

     ("BBC 1" . "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_one/format/pls.pls")
     ("BBC 2" . "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_two/format/pls.pls")
     ("BBC 3" . "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_three/format/pls.pls")
     ("BBC 4" . "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_fourfm/format/pls.pls")
     ("BBC 4 Xtra" . "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_four_extra/format/pls.pls")

     ("No Agenda" . "http://listen.noagendastream.com/noagenda")

     ("OEM Radio" . "https://rosetta.shoutca.st/tunein/oemradio.pls")

     ("Psyradio Prog" . "http://streamer.psyradio.org:8010/listen.pls")
     ("Psyradio Chill" . "http://streamer.psyradio.org:8020/listen.pls")
     ("Psyradio Psytrance" . "http://streamer.psyradio.org:8030/listen.pls")
     ("Psyradio Alt" . "http://streamer.psyradio.org:8040/listen.pls")

     ("Secret Agent - Soma FM" . "https://somafm.com/secretagent130.pls")
     ("Drone Zone - Soma FM" . "https://somafm.com/dronezone130.pls")
     ("Cliqhop - Soma FM" . "https://somafm.com/cliqhop130.pls") 
     ("Def Con - soma fm" . "https://somafm.com/defcon256.pls")

     ("Cyberia - lainon" . "https://lainon.life/radio/cyberia.ogg.m3u")
     ("Cafe - lainon" . "https://lainon.life/radio/cafe.ogg.m3u")
     ("Swing - laion" . "https://lainon.life/radio/swing.mp3.m3u")
     
     )))

(message "Setup radio loaded.")
(provide 'setup-radio)

;;; setup-radio.el ends here

